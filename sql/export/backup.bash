#!/bin/bash

read -p "Sure to perform backup (erase old files)? Sure pipe parents were loaded? (y/n) " answ
if [[ "$answ" == "y" ]]
then

# export pressure zones
pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format plain --data-only --inserts --column-inserts --verbose --file tempfile --table "distribution.pressurezone" "sige"
cat tempfile | sed 's/INSERT INTO pressurezone/INSERT INTO distribution.pressurezone/g' > /home/denis/Documents/qgis/qwat/sql/sige_data/data_pressurezone.sql
rm tempfile

#  export node
pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format plain --data-only --inserts --column-inserts --verbose --file tempfile --table "distribution.node" "sige"
cat tempfile | sed 's/INSERT INTO node/INSERT INTO distribution.node/g' > /home/denis/Documents/qgis/qwat/sql/sige_data/data_node.sql
rm tempfile

# parent chld relations
psql -h 172.24.171.203 -U "sige" -c "SELECT COUNT(id) AS current_relations_in_pipe FROM distribution.pipe WHERE id_parent IS NOT NULL;"
read -p "Are you sure to export relations? Previous SQL file will deleted! (y/n) " answ
if [[ "$answ" == "y" ]]
then
	#psql -h 172.24.171.203 -U sige -c "SELECT 'UPDATE distribution.pipe SET id_parent='||id_parent||' WHERE id='||id||';', id, id_parent, ST_AsText(ST_StartPoint(geometry)),ST_AsText(ST_EndPoint(geometry)) FROM distribution.pipe WHERE id_parent IS NOT NULL ORDER BY id_parent;" > /home/denis/Documents/qgis/qwat/sql/sige_data/pipe.parent.dat
	psql -h 172.24.171.203 -U sige -c "SELECT 'UPDATE distribution.pipe SET id_parent='||id_parent||' WHERE id='||id||';' FROM distribution.pipe WHERE id_parent IS NOT NULL ORDER BY id,id_parent;" > temp
	awk 'match($0,"UPDATE") !=0 {print $0}' temp > temp2
	sed '1i BEGIN;'  temp2 > temp
	sed '$a COMMIT;' temp > temp2
	mv temp2 /home/denis/Documents/qgis/qwat/sql/sige_data/data_pipe_id_parent.sql
	rm temp
fi

# export installation
pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format plain --data-only --inserts --column-inserts --verbose --file tempfile --table "distribution.installation" "sige"
cat tempfile | sed 's/INSERT INTO installation/INSERT INTO distribution.installation/g' > /home/denis/Documents/qgis/qwat/sql/sige_data/data_installation_tank.sql
rm tempfile
pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format plain --data-only --inserts --column-inserts --verbose --file tempfile --table "distribution.installation_tank" "sige"
cat tempfile | sed 's/INSERT INTO installation_tank/INSERT INTO distribution.installation_tank/g' > /home/denis/Documents/qgis/qwat/sql/sige_data/data_installation_tank.sql
rm tempfile
pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format plain --data-only --inserts --column-inserts --verbose --file tempfile --table "distribution.installation_treatment" "sige"
cat tempfile | sed 's/INSERT INTO installation_treatment/INSERT INTO distribution.installation_treatment/g' > /home/denis/Documents/qgis/qwat/sql/sige_data/data_installation_treatment.sql
rm tempfile
pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format plain --data-only --inserts --column-inserts --verbose --file tempfile --table "distribution.installation_pump" "sige"
cat tempfile | sed 's/INSERT INTO installation_pump/INSERT INTO distribution.installation_pump/g' > /home/denis/Documents/qgis/qwat/sql/sige_data/data_installation_pump.sql
rm tempfile

read -p "Push to github=== " answ
	if [[ "$answ" == "y" ]]
	then
		cd /home/denis/Documents/qgis/qwat/sql/sige_data/
		git add data_pressurezone.sql data_pipe_id_parent.sql data_installation_tank.sql
		git commit -m "sige data"
		git push
	fi
fi
