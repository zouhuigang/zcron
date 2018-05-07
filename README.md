### 基于[webcron](https://github.com/lisijie/webcron)项目的改进

改进理由:

	1.不支持跟项目的完美对接，例如，嵌入已有管理后台，放个连接上去，还要用户密码重新登录。
	2.没有api操作接口


安装说明

系统需要安装Go和MySQL。

### 获取源码

	$ go get github.com/zouhuigang/zcron
	go bulid zcron.go
	或
	pack.bat/pack.sh

打开配置文件 conf/app.conf，修改相关配置。

### 创建数据库webcron，再导入install.sql

	$ mysql -u username -p -D zcron < install.sql

### 运行

	$ ./zcron
	或
	$ nohup ./zcron 2>&1 > error.log &
	设为后台运行

###访问：

	http://localhost:8000

帐号：admin 密码：admin888



### 端口失败

	cat /proc/sys/net/ipv4/ip_local_port_range

	https://www.linuxidc.com/Linux/2016-01/127905.htm


 	启用iptables 
	iptables -I INPUT -p tcp --dport 8001 -j ACCEPT

	firewall-cmd --zone=public --add-port=60001/tcp --permanent
	firewall-cmd --reload


### 打包成一个fpm软件

[fpm具体安装方法](http://zouhuigang.anooc.com/yum/make-self-rpm/)

将文件上传到服务器指定目录( mkdir -p /usr/local/software/zcron && cd /usr/local/software/zcron)
>/conf目录，/static目录，/views目录和zcron文件上传到/nfs_file/software/zcron目录下，并写入权限 chmod +x zcron
>zcron.service上传到/usr/lib/systemd/system目录下


	cd /usr/local/software/zcron

	fpm -s dir -t rpm -n zcron -v 1.0.0 --config-files  /usr/lib/systemd/system/zcron.service  -f /usr/local/software/zcron


之后变生成：

	zcron-1.0.0-1.x86_64.rpm

本地安装：

	yum localinstall -y zcron-1.0.0-1.x86_64.rpm

	yum remove -y zcron


安装完成，请修改usr/local/software/zcron/config/下面的配置文件


