

CREATE OR REPLACE FUNCTION distribution.fn_node_update_id() RETURNS void AS
$BODY$
declare 
  node_table        record;
  stmt     text;
  max_id   integer;
begin
  FOR node_table IN SELECT * FROM distribution.od_node_table
    LOOP
    RAISE NOTICE '%', node_table.table_name;
    stmt := 'UPDATE distribution.' || node_table.table_name || ' SET id_node = distribution.fn_node_get_id(geometry,false);';
    EXECUTE stmt;
  END LOOP;
end;
$BODY$
LANGUAGE 'plpgsql';

