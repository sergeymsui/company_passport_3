
#!/bin/bash

psql -U postgres -f ./insert.sql
psql -U postgres -f ./04.sql
psql -U postgres -f ./05.sql
psql -U postgres -f ./06.sql

