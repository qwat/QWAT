
pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password --format tar --inserts --column-inserts --verbose --file "distribution.backup" --schema "distribution" "sige"

# # plain text
# 
# # schema plain text
# /usr/bin/pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password \
# --format plain --schema-only --inserts --column-inserts \
# --verbose --file "backup_distribution_schema.sql" --schema "distribution" "sige"
# 
# # data plain text
# /usr/bin/pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password \
# --format plain --data-only --inserts --column-inserts \
# --verbose --file "backup_distribution_data.sql" --schema "distribution" "sige"
