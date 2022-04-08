rm sakila-it.sqlite
sed -f sostituzioni.sed sqlite-sakila-schema.sql > sakila-it-schema.sql
sed -f sostituzioni.sed sqlite-sakila-insert-data.sql > sakila-it-data.sql
sqlite3 sakila-it.sqlite < sakila-it-schema.sql
sqlite3 sakila-it.sqlite < sakila-it-data.sql

