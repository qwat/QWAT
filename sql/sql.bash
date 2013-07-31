#read -p "Press any key to continue..."
#psql -h 172.24.171.$ip -U sige -f roles.sql
read -p "REMEMBER TO BACKUP!!! CONTINUE? (y/n) " answ
if [[ "$answ" == "y" ]]
then

read -p "Last xxx of IP : " ip

psql -h 172.24.171.$ip -U sige -c "DROP SCHEMA distribution CASCADE;"
psql -h 172.24.171.$ip -U sige -c "CREATE SCHEMA distribution;"

psql -h 172.24.171.$ip -U sige -f fcn_tool.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f fcn_geom.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f visible.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f status.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f precision.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f labelview.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f node.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f node_fcn.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f dimension.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pressurezone.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f pressurezone_child_parent.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f protectionzone_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f protectionzone.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f protectionzone_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f district.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f district_fcn.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f distributor.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f printmap.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f printmap_fcn.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f hydrant_provider.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f hydrant_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f hydrant.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f hydrant_view.sql
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
psql -h 172.24.171.$ip -U sige -f pipe_fcn.sql
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
psql -h 172.24.171.$ip -U sige -f subscriber_pipe_relation.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f installation_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f remote_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installation.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installation_tank.sql
read -p "Press any key to continue..."
#psql -h 172.24.171.$ip -U sige -f installation_tank_cistern.sql
#read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f installation_view.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f samplingpoint.sql
#read -p "Press any key to continue..."
#psql -h 172.24.171.$ip -U sige -f samplingpoint_view.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f altitude.sql


# BIG TABLE SEARCH
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f search_view.sql

# CONTROL
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f control/control_node.sql

# AUDIT TABLES
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f audit.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f audit_tables.sql


fi

