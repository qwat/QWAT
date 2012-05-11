


#  export nodes
pg_dump --host 172.24.171.202 --port 5432 --username "sige" --role "sige" --no-password  --format tar --inserts --verbose --file "/home/denis/Documents/qgis/qwat/sql/sige_data/nodes.tar" --table "distribution.nodes" "sige"



# parent chld relations
psql -h 172.24.171.202 -U sige -c "SELECT 'UPDATE distribution.pipes SET id_parent='||id_parent||' WHERE id='||id||';', id, id_parent, ST_AsText(ST_StartPoint(geometry)),ST_AsText(ST_EndPoint(geometry)) FROM distribution.pipes WHERE id_parent IS NOT NULL ORDER BY id_parent;" > /home/denis/Documents/qgis/qwat/sql/sige_data/pipes.parent.dat
