lujing=/var/backups/mysql                   #文件夹路径
name="数据库备份_$(date +%Y-%m-%d_%H-%M-%S).sql" #文件名字符串+时间
user=root                                   #该为数据库用户
password='MySQLpasswd'                     #改为数据库密码
sql_host=localhost
if [ ! -d "$lujing" ]; then #-d选项用于检查目录是否存在，!表示逻辑非，如果目录不存在则条件为真
    mkdir -p "$lujing"      #如果备份文件夹不存在，则使用mkdir命令创建该文件夹。-p选项用于创建目录及其所有父级目录
    echo "备份文件夹 $lujing 不存在，已创建该文件夹。"
fi
mysqldump -h $sql_host -u $user -p$password --all-databases >$lujing/$name

# mysqldump是一个MySQL备份工具，用于将MySQL数据库中的数据和结构导出为SQL脚本。
# -h选项用于指定MySQL服务器的主机名或IP地址。
# --all-databases选项表示备份所有数据库，也可以单独写数据库名字备份单独数据库。
