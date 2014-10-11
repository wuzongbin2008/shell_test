#!/bin/sh
##############################################################
# gitlab集成发布系统数据库备份sh.                                        #
##############################################################

backup_server_ip="10.77.121.138"

data_sync_path="data_sync/backup/release_manager_db_bak/"
subffix=$(date  +'%Y%m%d%H%M')
pwd_path=$PWD
echo "current path = $pwd_path"

backup_file=$pwd_path"/mysql_db_bak/release_manager_bak_$subffix.sql.gz"
db_ip="127.0.0.1"
db_port="3307"
mysqldump -h $db_ip -P $db_port -u root --password="sina@release&1" --default-character-set=utf8  release_manager|gzip > $backup_file 

#exit 0
while [ TRUE ]
do
	echo "start rsync"
	if [ -e $backup_file ]
        then
	    rsync_cmd="rsync -av $backup_file   root@$backup_server_ip::$data_sync_path"
	    echo $rsync_cmd
	    $rsync_cmd
	    echo "rsync db backup success"
	    exit 0
	fi
	sleep 1
done


	

