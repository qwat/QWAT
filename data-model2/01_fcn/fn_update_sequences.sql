

CREATE OR REPLACE FUNCTION qwat.fn_update_sequences() RETURNS void AS
$BODY$
declare 
  r        record;
  stmt     text;
  max_id   integer;
begin
  for r in (
              select *
              from (
                select table_schema, 
                       table_name, 
                       column_name, 
                       pg_get_serial_sequence(table_schema||'.'||table_name, column_name) as col_sequence
                from information_schema.columns
                where table_schema = 'qwat'
              ) t
              where col_sequence is not null
        ) 
  loop
    stmt := 'select coalesce(max('||r.column_name||'), 0) + 1 from '||r.table_schema||'.'||r.table_name;
    execute stmt into max_id;
    raise notice 'Next ID for %.%.% is %', r.table_schema, r.table_name, r.column_name, max_id;
    perform setval(r.col_sequence, max_id); 
  end loop;
end;
$BODY$
LANGUAGE 'plpgsql';

