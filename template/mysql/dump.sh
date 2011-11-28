#!${hosting_usr_local_bin}/bash

MYSQLPATH=${hosting_usr_local_bin}
DF=${hosting_site_dir}/dumps/`date '+%Y%m%d'`.dump

mkdir -p ${hosting_site_dir}/dumps

# clean sessions
echo 'truncate table django_session;' | \
    $MYSQLPATH/mysql \
        -h ${db_host} \
        -u ${db_user} \
        -p${db_pass} \
        ${db_name}

# make database dump
$MYSQLPATH/mysqldump \
    -h ${db_host} \
    -u ${db_user} \
    -p${db_pass} \
    ${db_name} > $DF

# compress it
/usr/bin/bzip2 $DF
# check for old dumps, keep the last week only, the rest will be deleted
find ${hosting_dump_dir} -name '*.dump.bz2' -mtime +7 -delete
exit 0
