#read -p "Press any key to continue..."
#psql -h 172.24.171.$ip -U sige -f roles.sql

read -p "server 75 or 202 : " ip

psql -h 172.24.171.$ip -U sige -c "DROP SCHEMA distribution CASCADE; CREATE SCHEMA distribution;"

psql -h 172.24.171.$ip -U sige -f tool_functions.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f visible.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f nodes.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f dimension.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_install_method.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f precision.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_protection.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pressure_zones.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f districts.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f owner.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_functions.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_material.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_status.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f printmaps.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valves_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valves_function.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valves.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valves_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valves_view_alternative.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_schema.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipes_children_parent.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f subscriber_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f subscriber.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f subscriber_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installations_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installations.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installations_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f altitude.sql

# CONTROL
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f control/control_nodes.sql

# SIGE DATA
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_pressure_zones.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_nodes.sql -v ON_ERROR_STOP=1

# TODO AFTER PIPE IMPORT
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_pipes_id_parent.sql -v ON_ERROR_STOP=1



