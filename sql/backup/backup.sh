
today=`date '+%Y%m%d'`

pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password --format tar --inserts --column-inserts --verbose --file "../sige_data/qwat_$today.backup" --schema "qwat" "sige"

# # plain text
# 
# # schema plain text
# /usr/bin/pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password \
# --format plain --schema-only --inserts --column-inserts \
# --verbose --file "backup_qwat_schema.sql" --schema "qwat" "sige"
# 
# # data plain text
# /usr/bin/pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password \
# --format plain --data-only --inserts --column-inserts \
# --verbose --file "backup_qwat_data.sql" --schema "qwat" "sige"
