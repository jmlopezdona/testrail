FROM centos:7

# Upgrade yum
RUN yum -y upgrade
RUN yum -y install wget unzip policycoreutils

# Install apache2
RUN yum -y install httpd httpd-devel

# Install php packages
RUN yum -y install php php-mysql php-common php-gd php-mbstring php-mcrypt php-devel php-xml

# Install php ioncube loaders
RUN wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RUN tar -xvf ioncube_loaders_lin_x86-64.tar.gz
RUN rm ioncube_loaders_lin_x86-64.tar.gz
RUN mv ioncube /opt/
RUN chown -R apache:apache /opt/ioncube
RUN chmod -R 755 /opt/ioncube
RUN echo "zend_extension=/opt/ioncube/ioncube_loader_lin_5.4.so" >> /etc/php.ini

# Install testrail package
RUN wget http://www.gurock.com/downloads/testrail/testrail-latest-ion53.zip
RUN unzip testrail-latest-ion53.zip
RUN rm testrail-latest-ion53.zip
RUN mv testrail /var/www/html/
RUN chown -R apache:apache /var/www/html
RUN chmod -R 755 /var/www/html
RUN restorecon -r /var/www/html
RUN mkdir /opt/testrail
RUN mkdir /opt/testrail/attachments
RUN mkdir /opt/testrail/reports
RUN mkdir /opt/testrail/logs
RUN chown -R apache:apache /opt/testrail
RUN chmod -R 755 /opt/testrail
#RUN chcon -R -t httpd_sys_rw_content_t /opt/testrail

EXPOSE 80
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
