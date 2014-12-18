
--
-- Audited data. Lots of information is available, it's just a matter of how much
-- you really want to record. See:
--
--   http://www.postgresql.org/docs/9.1/static/functions-info.html
--
-- Remember, every column you add takes up more audit table space and slows audit
-- inserts.
--
-- Every index you add has a big impact too, so avoid adding indexes to the
-- audit table unless you REALLY need them. The hstore GIST indexes are
-- particularly expensive.
--
-- It is sometimes worth copying the audit table, or a coarse subset of it that
-- you're interested in, into a temporary table where you CREATE any useful
-- indexes and do your analysis.
--
DROP TABLE IF EXISTS qwat.logged_actions;

CREATE TABLE qwat.logged_actions (
    event_id bigserial PRIMARY KEY,
    schema_name text NOT NULL,
    table_name text NOT NULL,
    relid oid NOT NULL,
    session_user_name text,
    action_tstamp_tx TIMESTAMP WITH TIME ZONE NOT NULL,
    action_tstamp_stm TIMESTAMP WITH TIME ZONE NOT NULL,
    action_tstamp_clk TIMESTAMP WITH TIME ZONE NOT NULL,
    transaction_id bigint,
    application_name text,
    client_addr inet,
    client_port integer,
    client_query text NOT NULL,
    action TEXT NOT NULL CHECK (action IN ('I','D','U', 'T')),
    row_data hstore,
    changed_fields hstore,
    statement_only BOOLEAN NOT NULL
);
 
REVOKE ALL ON qwat.logged_actions FROM public;
 
COMMENT ON TABLE qwat.logged_actions IS 'History of auditable actions on audited tables, from qwat.if_modified_func()';
COMMENT ON COLUMN qwat.logged_actions.event_id IS 'Unique identifier for each auditable event';
COMMENT ON COLUMN qwat.logged_actions.schema_name IS 'Database schema audited table for this event is in';
COMMENT ON COLUMN qwat.logged_actions.table_name IS 'Non-schema-qualified table name of table event occured in';
COMMENT ON COLUMN qwat.logged_actions.relid IS 'Table OID. Changes with drop/create. Get with ''tablename''::regclass';
COMMENT ON COLUMN qwat.logged_actions.session_user_name IS 'Login / session user whose statement caused the audited event';
COMMENT ON COLUMN qwat.logged_actions.action_tstamp_tx IS 'Transaction start timestamp for tx in which audited event occurred';
COMMENT ON COLUMN qwat.logged_actions.action_tstamp_stm IS 'Statement start timestamp for tx in which audited event occurred';
COMMENT ON COLUMN qwat.logged_actions.action_tstamp_clk IS 'Wall clock time at which audited event''s trigger call occurred';
COMMENT ON COLUMN qwat.logged_actions.transaction_id IS 'Identifier of transaction that made the change. May wrap, but unique paired with action_tstamp_tx.';
COMMENT ON COLUMN qwat.logged_actions.client_addr IS 'IP address of client that issued query. Null for unix domain socket.';
COMMENT ON COLUMN qwat.logged_actions.client_port IS 'Remote peer IP port address of client that issued query. Undefined for unix socket.';
COMMENT ON COLUMN qwat.logged_actions.client_query IS 'Top-level query that caused this auditable event. May be more than one statement.';
COMMENT ON COLUMN qwat.logged_actions.application_name IS 'Application name set when this audit event occurred. Can be changed in-session by client.';
COMMENT ON COLUMN qwat.logged_actions.action IS 'Action type; I = insert, D = delete, U = update, T = truncate';
COMMENT ON COLUMN qwat.logged_actions.row_data IS 'Record value. Null for statement-level trigger. For INSERT this is the new tuple. For DELETE and UPDATE it is the old tuple.';
COMMENT ON COLUMN qwat.logged_actions.changed_fields IS 'New values of fields changed by UPDATE. Null except for row-level UPDATE events.';
COMMENT ON COLUMN qwat.logged_actions.statement_only IS '''t'' if audit event is from an FOR EACH STATEMENT trigger, ''f'' for FOR EACH ROW';
 
CREATE INDEX logged_actions_relid_idx ON qwat.logged_actions(relid);
CREATE INDEX logged_actions_action_tstamp_tx_stm_idx ON qwat.logged_actions(action_tstamp_stm);
CREATE INDEX logged_actions_action_idx ON qwat.logged_actions(action);
 
CREATE OR REPLACE FUNCTION qwat.if_modified_func() RETURNS TRIGGER AS $body$
DECLARE
    audit_row qwat.logged_actions;
    include_values BOOLEAN;
    log_diffs BOOLEAN;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN
    IF TG_WHEN <> 'AFTER' THEN
        RAISE EXCEPTION 'qwat.if_modified_func() may only run as an AFTER trigger';
    END IF;
 
    audit_row = ROW(
        NEXTVAL('qwat.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );
 
    IF NOT TG_ARGV[0]::BOOLEAN IS DISTINCT FROM 'f'::BOOLEAN THEN
        audit_row.client_query = NULL;
    END IF;
 
    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
 
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*);
        audit_row.changed_fields =  (hstore(NEW.*) - audit_row.row_data) - excluded_cols;
        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RETURN NULL;
        END IF;
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
    ELSE
        RAISE EXCEPTION '[qwat.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NULL;
    END IF;
    INSERT INTO qwat.logged_actions VALUES (audit_row.*);
    RETURN NULL;
END;
$body$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
;
 
 
COMMENT ON FUNCTION qwat.if_modified_func() IS $body$
Track changes TO a TABLE at the statement AND/OR row level.
 
Optional parameters TO TRIGGER IN CREATE TRIGGER call:
 
param 0: BOOLEAN, whether TO log the query text. default 't'.
 
param 1: text[], COLUMNS TO IGNORE IN updates. default [].
 
         Updates TO ignored cols are omitted FROM changed_fields.
 
         Updates WITH only ignored cols changed are NOT inserted
         INTO the audit log.
 
         Almost ALL the processing work IS still done FOR updates
         that ignored. IF you need TO save the LOAD, you need TO USE
         WHEN clause ON the TRIGGER instead.
 
         No warning OR error IS issued IF ignored_cols contains COLUMNS
         that do NOT exist IN the target TABLE. This lets you specify
         a standard SET of ignored COLUMNS.
 
There IS no parameter TO disable logging of VALUES. ADD this TRIGGER AS
a 'FOR EACH STATEMENT' rather than 'FOR EACH ROW' TRIGGER IF you do NOT
want TO log row VALUES.
 
Note that the user name logged IS the login role FOR the session. The audit TRIGGER
cannot obtain the active role because it IS reset BY the SECURITY DEFINER invocation
of the audit TRIGGER its self.
$body$;
 
 
 
CREATE OR REPLACE FUNCTION qwat.audit_table(target_table regclass, audit_rows BOOLEAN, audit_query_text BOOLEAN, ignored_cols text[]) RETURNS void AS $body$
DECLARE
  stm_targets text = 'INSERT OR UPDATE OR DELETE OR TRUNCATE';
  _q_txt text;
  _ignored_cols_snip text = '';
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_table::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_table::text;
 
    IF audit_rows THEN
        IF array_length(ignored_cols,1) > 0 THEN
            _ignored_cols_snip = ', ' || quote_literal(ignored_cols);
        END IF;
        _q_txt = 'CREATE TRIGGER audit_trigger_row AFTER INSERT OR UPDATE OR DELETE ON ' || 
                 target_table::text || 
                 ' FOR EACH ROW EXECUTE PROCEDURE qwat.if_modified_func(' ||
                 quote_literal(audit_query_text) || _ignored_cols_snip || ');';
        RAISE NOTICE '%',_q_txt;
        EXECUTE _q_txt;
        stm_targets = 'TRUNCATE';
    ELSE
    END IF;
 
    _q_txt = 'CREATE TRIGGER audit_trigger_stm AFTER ' || stm_targets || ' ON ' ||
             target_table::text ||
             ' FOR EACH STATEMENT EXECUTE PROCEDURE qwat.if_modified_func('||
             quote_literal(audit_query_text) || ');';
    RAISE NOTICE '%',_q_txt;
    EXECUTE _q_txt;
 
END;
$body$
LANGUAGE 'plpgsql';
 
COMMENT ON FUNCTION qwat.audit_table(regclass, BOOLEAN, BOOLEAN, text[]) IS $body$
ADD auditing support TO a TABLE.
 
Arguments:
   target_table:     TABLE name, schema qualified IF NOT ON search_path
   audit_rows:       Record each row CHANGE, OR only audit at a statement level
   audit_query_text: Record the text of the client query that triggered the audit event?
   ignored_cols:     COLUMNS TO exclude FROM UPDATE diffs, IGNORE updates that CHANGE only ignored cols.
$body$;
 
-- Pg doesn't allow variadic calls with 0 params, so provide a wrapper
CREATE OR REPLACE FUNCTION qwat.audit_table(target_table regclass, audit_rows BOOLEAN, audit_query_text BOOLEAN) RETURNS void AS $body$
SELECT qwat.audit_table($1, $2, $3, ARRAY[]::text[]);
$body$ LANGUAGE SQL;
 
-- And provide a convenience call wrapper for the simplest case
-- of row-level logging with no excluded cols and query logging enabled.
--
CREATE OR REPLACE FUNCTION qwat.audit_table(target_table regclass) RETURNS void AS $$
SELECT qwat.audit_table($1, BOOLEAN 't', BOOLEAN 't');
$$ LANGUAGE 'sql';


