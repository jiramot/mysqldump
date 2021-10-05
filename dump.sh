#!/bin/sh

DBSERVER="${DBSERVER:-127.0.0.1}"
DATABASE="${DATABASE:-}"
USER="${USER:-}"
PASS="${PASS:-}"
TABLE="${TABLE:-}"

if [ -z "$TABLE" ];
then
FILE=/dump/"$DATABASE-"`date +"%Y%m%d"`.sql
mysqldump --opt --user=${USER} --password=${PASS} --protocol=TCP --host=${DBSERVER} ${DATABASE} > ${FILE}; 
else 
FILE=/dump/"$DATABASE-$TABLE-"`date +"%Y%m%d"`.sql
mysqldump --opt --user=${USER} --password=${PASS} --protocol=TCP --host=${DBSERVER} ${DATABASE} ${TABLE} > ${FILE}; 
fi

gzip $FILE

echo "${FILE}.gz was created:"
ls -l ${FILE}.gz