
#./sql.bash

# SIGE DATA
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f sige_data/data_district.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f sige_data/data_distributor.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f sige_data/data_pressurezone.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f sige_data/data_node.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f sige_data/data_samplingpoint.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.203 -U sige -f sige_data/data_protectionzone.sql -v ON_ERROR_STOP=1


# TODO AFTER PIPE IMPORT
read -p "Import SQL fini -> proceder a l'import FME -> puis continuer..."
psql -h 172.24.171.203 -U sige -f sige_data/data_pipe_id_parent.sql -v ON_ERROR_STOP=1
