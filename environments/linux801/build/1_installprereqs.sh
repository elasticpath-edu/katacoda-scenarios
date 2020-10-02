wget https://cdn.azul.com/zulu/bin/zulu8.46.0.19-ca-jdk8.0.252-linux_x64.tar.gz
tar -xf zulu8.46.0.19-ca-jdk8.0.252-linux_x64.tar.gz
cd zulu8.46.0.19-ca-jdk8.0.252-linux_x64/
sudo mkdir /usr/lib/jvm
sudo mv zulu8.46.0.19-ca-jdk8.0.252-linux_x64 /usr/lib/jvm
export JAVA_HOME=/usr/lib/jvm/zulu8.46.0.19-ca-jdk8.0.252-linux_x64
export PATH=/$JAVA_HOME/bin:$PATH
export JAVA_OPTS='-Xmx1024m -Dsun.lang.ClassLoader.allowArraySyntax=true'

wget http://archive.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz
tar -xf apache-maven-3.6.2-bin.tar.gz
export MAVEN_HOME=/home/ec2-user/apache-maven-3.6.2
export MAVEN_OPTS='-Xmx2048m -XX:ReservedCodeCacheSize=128m -Dsun.lang.ClassLoader.allowArraySyntax=true'
export PATH=$PATH:$MAVEN_HOME/bin


wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
sudo yum localinstall mysql57-community-release-el7-8.noarch.rpm -y
sudo yum install mysql-community-server -y
sudo service mysqld start
export PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $11}')
mysql -h localhost -u root -p $PASSWORD -e "uninstall plugin validate_password;"
mysql -h localhost -u root -p $PASSWORD -e "UPDATE mysql.user SET authentication_string=PASSWORD('password') where user='root';"
sed -i 's/^\(transaction_isolation\s*=\s*\).*$/\1READ-COMMITTED/' /etc/my.cnf
sudo service mysqld restart
sudo service mysqld status

