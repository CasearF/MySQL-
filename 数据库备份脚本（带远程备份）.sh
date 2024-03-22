set -e
name="数据库备份_$(date +%Y-%m-%d_%H-%M-%S).sql"
bendi=/var/backups/mysql    #定义本地路径
yuancheng=192.168.236.30::backup   #定义远程路径
user=root    #定义账号
password='MySQLpasswd'  #定义密码
sql_host=localhost   #定义位置
if [ ! -d "$bendi" ]; then   #-d检查目录是否存在
  mkdir -p "$bendi"        #如果不存在则使用mkdir创建
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
