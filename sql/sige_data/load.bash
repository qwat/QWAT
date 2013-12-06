
#./sql.bash

read -p "REMEMBER TO BACKUP!!! CONTINUE? (y/n) " answ
if [[ "$answ" == "y" ]]
then

# SIGE DATA
psql -h 172.24.171.203 -U sige -f data_district.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f data_printmap.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f data_distributor.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f data_pressurezone.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f data_node.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f data_samplingpoint.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f data_protectionzone.sql -v ON_ERROR_STOP=1


# TODO AFTER PIPE IMPORT
read -p "Import SQL fini -> proceder a l'import FME -> puis continuer..."
psql -h 172.24.171.203 -U sige -f data_pipe_id_parent.sql -v ON_ERROR_STOP=1
read -p " continuer..."
# psql -h 172.24.171.203 -U sige -f data_installation_building.sql -v ON_ERROR_STOP=1
# read -p " continuer..."
# psql -h 172.24.171.203 -U sige -f data_installation_valvechamber.sql -v ON_ERROR_STOP=1
# read -p " continuer..."
# psql -h 172.24.171.203 -U sige -f data_installation_pressurecontrol.sql -v ON_ERROR_STOP=1
# read -p " continuer..."
# psql -h 172.24.171.203 -U sige -f data_installation_tank.sql -v ON_ERROR_STOP=1
# read -p " continuer..."
# psql -h 172.24.171.203 -U sige -f data_installation_treatment.sql -v ON_ERROR_STOP=1
# read -p " continuer..."
# psql -h 172.24.171.203 -U sige -f data_installation_pump.sql -v ON_ERROR_STOP=1
# read -p " continuer..."
# psql -h 172.24.171.203 -U sige -f data_installation_source.sql -v ON_ERROR_STOP=1
# read -p " continuer..."
psql -h 172.24.171.203 -U sige -f data_hydrant_complete.sql -v ON_ERROR_STOP=1
read -p " continuer..."



pg_restore --data-only  --disable-triggers --single-transaction --verbose --superuser=sige --schema=distribution \
--dbname=sige --host 172.24.171.203 --port 5432 --username "sige" --no-password \
--table od_installation_building              \
--schema=distribution distribution.backup
read -p " continuer..."
pg_restore --data-only  --disable-triggers --single-transaction --verbose --superuser=sige --schema=distribution \
--dbname=sige --host 172.24.171.203 --port 5432 --username "sige" --no-password \
--table od_installation_tank                  \
--schema=distribution distribution.backup
read -p " continuer..."
pg_restore --data-only  --disable-triggers --single-transaction --verbose --superuser=sige --schema=distribution \
--dbname=sige --host 172.24.171.203 --port 5432 --username "sige" --no-password \
--table od_installation_source                \
--schema=distribution distribution.backup
read -p " continuer..."
pg_restore --data-only  --disable-triggers --single-transaction --verbose --superuser=sige --schema=distribution \
--dbname=sige --host 172.24.171.203 --port 5432 --username "sige" --no-password \
--table od_installation_pump                  \
--schema=distribution distribution.backup
read -p " continuer..."
pg_restore --data-only  --disable-triggers --single-transaction --verbose --superuser=sige --schema=distribution \
--dbname=sige --host 172.24.171.203 --port 5432 --username "sige" --no-password \
--table od_installation_treatment             \
--schema=distribution distribution.backup
read -p " continuer..."
pg_restore --data-only  --disable-triggers --single-transaction --verbose --superuser=sige --schema=distribution \
--dbname=sige --host 172.24.171.203 --port 5432 --username "sige" --no-password \
--table od_installation_pressurecontrol       \
--schema=distribution distribution.backup
read -p " continuer..."
pg_restore --data-only  --disable-triggers --single-transaction --verbose --superuser=sige --schema=distribution \
--dbname=sige --host 172.24.171.203 --port 5432 --username "sige" --no-password \
--table od_installation_valvechamber          \
--schema=distribution distribution.backup
read -p " continuer..."

fi
