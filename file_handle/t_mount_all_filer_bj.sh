#!/bin/sh
##############################################################
# ͼƬ������������sh.                                        #
# ������Ҫmount��nfs������Ѿ�mount�ˣ��Ͳ���Ҫ��mount��     #
##############################################################

#�����Ƿ��¼��־
write_log="TURE"
#��ǰ����
date=`date`
#��־��¼Ŀ��
logname="/root/mount_filer.log"

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
export LANG="en_US"

#��־��¼ϵͳ
write_to_log()
{
	echo $1
	if [ $write_log ]
	then
		echo  "$1"  >> $logname
	fi
}

#����һ�γ���
run_once()
{
	$1
	if [ $? -eq 0 ] 
	then
		infosucc="[ok]: $1"
		write_to_log "$infosucc"
	else
		infoerror="[ERROR]: $1"
		write_to_log "$infoerror"
	fi
}
 

#����nfs�ļ�
#���Ա����ļ����Ƿ����
#������ȱ������mount�Ƿ���ȷ�Ĳ���,��Ҫ����
# $1 Զ���ļ��� $2 �����ļ��� $3 ���ֲ���
mount_nfs()
{
	/bin/mkdir -p $2
	if [ ! -e $2 ]
	then
		infodir="[ERROR]: $2 not exit!!"
		write_to_log "infodir"
	fi
	if  ! df|grep -q "$2$"
	then
		if [ $system = "FreeBSD" ]; then
		mount_cmd="/sbin/mount_nfs $3 $1 $2"
		else
		mount_cmd="/bin/mount $3 $1 $2"
		fi
		run_once "$mount_cmd"
	else
		infomount="[ok]: $1 already mounted"
		write_to_log "$infomount"
	fi
}

#������ʼ
#��־��¼��ʼ
info="++++++++++++++++++++++++++++++++++++++++++++++++++++"
write_to_log "$info"
info="$date mount_filer.sh start"
write_to_log "$info"

#���mount filer
system=`uname -s`
if [ $system = "FreeBSD" ]; then
param="-o rw,noatime, -3 -T"
else
#param="-o rw,noatime,nfsvers=3,tcp"
param="-o rw,noatime,bg,hard,nointr,proto=tcp,vers=3,rsize=32768,wsize=32768,timeo=600"
fi
#mount vols for weibo_img
mount_nfs "10.55.37.103:/vol/vol_103_3" "/filer37103vol_103_3" "$param"
mount_nfs "10.55.37.103:/vol/vol_103_4" "/filer37103vol_103_4" "$param"
mount_nfs "10.55.37.77:/vol/vol1" "/filer3777vol1" "$param"
mount_nfs "10.55.37.77:/vol/vol2" "/filer3777vol2" "$param"
mount_nfs "10.55.37.79:/vol/vol1" "/filer3779vol1" "$param"
mount_nfs "10.55.37.79:/vol/vol2" "/filer3779vol2" "$param"

#mount vols for weibo_tva
mount_nfs "10.55.37.103:/vol/vol_103_5" "/filer37103vol_103_5" "$param"
mount_nfs "10.55.37.77:/vol/vol1_1" "/filer3777vol1_1" "$param"
mount_nfs "10.55.37.77:/vol/vol2_1" "/filer3777vol2_1" "$param"
mount_nfs "10.55.37.79:/vol/vol1_1" "/filer3779vol1_1" "$param"
mount_nfs "10.55.37.79:/vol/vol2_1" "/filer3779vol2_1" "$param"

#�������
infoend="$date end"
write_to_log "$infoend"
sleep 60
