# Source Image name
FROM ubuntu:18.04
# Mainter Name
MAINTAINER Lalit Ojha
# Command to update and install packages
WORKDIR /var/www/html
ADD ./html /var/www/html
RUN apt-get update -y
RUN apt-get install -y python3
RUN cd /usr/local/bin ; ln -s /usr/bin/python3 python
RUN apt-get install -y python3-pip --no-install-recommends
RUN pip3 install -r requirements.txt
RUN apt-get install -y apache2
ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR
RUN apt-get install libapache2-mod-wsgi-py3 -y
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
# open port
EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
