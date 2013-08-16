
#./sql.bash

read -p "REMEMBER TO BACKUP!!! CONTINUE? (y/n) " answ
if [[ "$answ" == "y" ]]
then

# SIGE DATA
psql -h 172.24.171.203 -U sige -f data_district.sql -v ON_ERROR_STOP=1
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
psql -h 172.24.171.203 -U sige -f data_installation_tank.sql -v ON_ERROR_STOP=1
read -p " continuer..."
psql -h 172.24.171.203 -U sige -f data_installation_treatment.sql -v ON_ERROR_STOP=1
read -p " continuer..."
psql -h 172.24.171.203 -U sige -f data_installation_pump.sql -v ON_ERROR_STOP=1
read -p " continuer..."

fi
