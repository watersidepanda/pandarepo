FROM oraclelinux:7

MAINTAINER Rohit

# install http
#RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# install httpd
# RUN yum -y install httpd vim-enhanced bash-completion unzip
RUN yum -y install httpd 

# install mysql
RUN rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
RUN yum install -y mysql mysql-community-server 
RUN echo "NETWORKING=yes" > /etc/sysconfig/network
# start mysqld to create initial tables


# install php
RUN yum install -y php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml

ADD phpinfo.php /var/www/html/

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

#RUN service mysqld start
#CMD ["/etc/init.d/mysqld start"]

