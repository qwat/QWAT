rm tiles/*

gdal_retile.py -ps 256 256 -targetDir tiles -of AAIGrid riviera.asc

ls tiles/*.asc > asc.list

cat asc.list | awk '{print "/usr/lib/postgresql/9.1/bin/raster2pgsql -s 21781 -a ",$1," altitude.dtm > load.sql ; psql -f load.sql"}' > cmd_tiles.bash

psql -c "TRUNCATE TABLE altitude.dtm;"

bash cmd_tiles.bash


