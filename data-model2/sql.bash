read -p "REMEMBER TO BACKUP!!! CONTINUE? (y/n) " answ
if [[ "$answ" == "y" ]]
then

read -p "Last xxx of IP : " ip

PSQLCOMMAND="psql -h 172.24.171.$ip -U sige -v ON_ERROR_STOP=1"


rm create.sql
touch create.sql

echo -e "BEGIN;\n\nDROP SCHEMA IF EXISTS qwat CASCADE;\nCREATE SCHEMA qwat;\n\n" >> create.sql
for f in *
do
	if test -d "$f"; then
		cat create.sql $f/*.sql > tmp.tmp
		mv tmp.tmp create.sql
	fi
done

echo -e "COMMIT;\n" >> create.sql

$PSQLCOMMAND -f create.sql


fi
