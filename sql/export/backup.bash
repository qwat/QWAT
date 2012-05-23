#!/bin/bash


#  export nodes
pg_dump --host 172.24.171.202 --port 5432 --username "sige" --no-password  --format plain --data-only --inserts --verbose --file "/home/denis/Documents/qgis/qwat/sql/sige_data/data_nodes.sql" --table "distribution.nodes" "sige"

# parent chld relations
psql -h 172.24.171.202 -U "sige" -c "SELECT COUNT(id) AS current_relations_in_pipes FROM distribution.pipes WHERE id_parent IS NOT NULL;"
read -p "Are you sure to export relations? Previous SQL file will deleted! (y/n) " answ
if [[ "$answ" == "y" ]]
then
	#psql -h 172.24.171.202 -U sige -c "SELECT 'UPDATE distribution.pipes SET id_parent='||id_parent||' WHERE id='||id||';', id, id_parent, ST_AsText(ST_StartPoint(geometry)),ST_AsText(ST_EndPoint(geometry)) FROM distribution.pipes WHERE id_parent IS NOT NULL ORDER BY id_parent;" > /home/denis/Documents/qgis/qwat/sql/sige_data/pipes.parent.dat
	psql -h 172.24.171.202 -U sige -c "SELECT 'UPDATE distribution.pipes SET id_parent='||id_parent||' WHERE id='||id||';' FROM distribution.pipes WHERE id_parent IS NOT NULL ORDER BY id_parent;" > temp
	awk 'match($0,"UPDATE") !=0 {print $0}' temp > temp2
	sed '1i BEGIN;'  temp2 > temp
	sed '$a COMMIT;' temp > temp2
	mv temp2 /home/denis/Documents/qgis/qwat/sql/sige_data/data_pipes_id_parent.sql
	rm temp
fi


read -p "press any key to finish"
