wget https://cdn.azul.com/zulu/bin/zulu8.46.0.19-ca-jdk8.0.252-linux_x64.tar.gz
tar -xf zulu8.46.0.19-ca-jdk8.0.252-linux_x64.tar.gz
cd zulu8.46.0.19-ca-jdk8.0.252-linux_x64/
mkdir /usr/lib/jvm
mv zulu8.46.0.19-ca-jdk8.0.252-linux_x64 /usr/lib/jvm
export JAVA_HOME=/usr/lib/jvm/zulu8.46.0.19-ca-jdk8.0.252-linux_x64
export PATH=/$JAVA_HOME/bin:$PATH
export JAVA_OPTS='-Xmx1024m -Dsun.lang.ClassLoader.allowArraySyntax=true'

wget http://archive.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz
tar -xf apache-maven-3.6.2-bin.tar.gz
export MAVEN_HOME=/home/ec2-user/apache-maven-3.6.2
export MAVEN_OPTS='-Xmx2048m -XX:ReservedCodeCacheSize=128m -Dsun.lang.ClassLoader.allowArraySyntax=true'
export PATH=$PATH:$MAVEN_HOME/bin


wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
yum localinstall mysql57-community-release-el7-8.noarch.rpm -y
yum install mysql-community-server -y
systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
# https://stackoverflow.com/questions/33510184/how-to-change-the-mysql-root-account-password-on-centos7/34207996#34207996
service mysqld start
mysql -u root -e "UPDATE mysql.user SET authentication_string = PASSWORD('password') WHERE User = 'root' AND Host = 'localhost';FLUSH PRIVILEGES;"
service mysqld stop
systemctl unset-environment MYSQLD_OPTS
sed -i 's/^\(transaction_isolation\s*=\s*\).*$/\1READ-COMMITTED/' /etc/my.cnf
service mysqld start

yum install -y epel-release
yum groupinstall -y "MATE Desktop"
rm -f /root/.vnc/passwd
printf "El4stic123\nEl4stic123\n\n" | vncpasswd
rm -f /tmp/.X11-unix/X1
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
sed -i 's/<USER>/root/' /etc/systemd/system/vncserver@.service
systemctl daemon-reload
rm -f /tmp/.X11-unix/X1
systemctl enable vncserver@:1
systemctl start vncserver@:1

yum install chromium
wget https://download.jetbrains.com/idea/ideaIC-2020.1.2.tar.gz?_ga=2.64397615.1862288659.1593703260-682370932.1593703260
mv ideaIC-2020.1.2.tar.gz\?_ga\=2.64397615.1862288659.1593703260-682370932.1593703260 ideaIC-2020.1.2.tar.gz
tar -xzf ideaIC-2020.1.2.tar.gz -C /opt

