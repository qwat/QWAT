#read -p "Press any key to continue..."
#psql -h 172.24.171.$ip -U sige -f roles.sql

read -p "server 75 or 202 : " ip

psql -h 172.24.171.$ip -U sige -f tool_functions.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f boolean.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f dimension.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f intersection.sql
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
psql -h 172.24.171.$ip -U sige -f valves.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f schema.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f subscriber_type.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f subscriber.sql
read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f 3d.sql


read -p "Press any key to continue..."
psql -h 172.24.171.$ip -U sige -f sige_data/data_pressure_zones.sql



