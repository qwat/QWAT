

CREATE OR REPLACE FUNCTION qwat.fn_node_update_id() RETURNS void AS
$BODY$
declare 
  node_table        record;
  stmt     text;
  max_id   integer;
begin
  FOR node_table IN SELECT * FROM qwat.od_node_table
    LOOP
    RAISE NOTICE '%', node_table.table_name;
    stmt := 'UPDATE qwat.' || node_table.table_name || ' SET id_node = qwat.fn_node_get_id(geometry,false);';
    EXECUTE stmt;
  END LOOP;
end;
$BODY$
LANGUAGE 'plpgsql';

