rm -f bibliografia-it.sqlite
sqlite3 bibliografia-it.sqlite < bibliografia-schema-it.sql 
sqlite3 bibliografia-it.sqlite < bibliografia-data-it.sql
