FROM dockerfile/ansible:latest
MAINTAINER Francis Reyes <freyes@snowballone.com.au>
ADD ansible /ansible
COPY run.sh /run.sh
CMD ["/run.sh"]
VOLUME ["/etc/mysql", "/var/lib/mysql", "/root"]
EXPOSE 3306
