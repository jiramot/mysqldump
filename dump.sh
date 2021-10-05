#!/bin/sh

DBSERVER="${DBSERVER:-127.0.0.1}"
DATABASE="${DATABASE:-}"
USER="${USER:-}"
PASS="${PASS:-}"

FILE=/dump/"$DATABASE"`date +"%Y%m%d"`.sql

mysqldump --opt --user=${USER} --password=${PASS} --protocol=TCP --host=${DBSERVER} ${DATABASE} > ${FILE}

gzip $FILE

# (5) show the user the result
echo "${FILE}.gz was created:"
ls -l ${FILE}.gz