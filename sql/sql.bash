#read -p "Press any key to continue..."
#psql -h 172.24.171.$ip -U sige -f roles.sql
read -p "REMEMBER TO BACKUP!!! CONTINUE? (y/n) " answ
if [[ "$answ" == "y" ]]
then

read -p "Last xxx of IP : " ip

psql -h 172.24.171.$ip -U sige -c "DROP SCHEMA distribution CASCADE; CREATE SCHEMA distribution;"

psql -h 172.24.171.$ip -U sige -f tool_fcn.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f visible.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f status.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f precision.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f node.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f node_fcn.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f dimension.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f dimension_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pressurezone.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f district.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f distributor.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f printmaps.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f hydrant_provider.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f hydrant_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f hydrant.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f hydrant_view.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f valve_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valve_function.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valve_maintenance.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valve.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valve_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valve_schema.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f valve_fcn.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f pipe_install_method.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipe_protection.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipe_function.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipe_material.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipe.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipe_view.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f pipe_schema.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pipe_children_parent.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f subscriber_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f subscriber.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f subscriber_view.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f installation_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installation.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installation_view.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f samplingpoint.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f samplingpoint_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f altitude.sql


# CONTROL
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f control/control_node.sql


# SIGE DATA
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_distributor.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_pressurezone.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_node.sql -v ON_ERROR_STOP=1
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_samplingpoint.sql -v ON_ERROR_STOP=1


# TODO AFTER PIPE IMPORT
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_pipe_id_parent.sql -v ON_ERROR_STOP=1

fi

