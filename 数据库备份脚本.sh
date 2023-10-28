set -e
name="数据库备份_$(date +%Y-%m-%d_%H-%M-%S).sql"
bendi=/var/backups/mysql
yuancheng=192.168.236.30::backup
user=root
password='MySQL@329958'
sql_host=localhost
if [ ! -d "$bendi" ]; then 
  mkdir -p "$bendi"        
  echo "备份文件夹 $bendi 不存在，已创建该文件夹。"
fi
bak(){
  echo "MySQL bakcup begin at `date`"
  echo "执行MySQLdump，备份文件路径为/var/backups/mysql/$name"
  mysqldump -hlocalhost -uroot -pMySQL@329958 a >/var/backups/mysql/$name
  echo "远程拷贝到192.168.236.30::backup$name"
  rsync -az $bendi$name.$d1 $yuancheng/$name
  echo "MySQL backup end at `date`"
}
bak >>${bendi}/mysqldump日志.log 2>>${bendi}/rsync日志.err
echo $("备份成功")
set +e
