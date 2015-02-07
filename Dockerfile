FROM dockerfile/ansible:latest
MAINTAINER Francis Reyes <freyes@snowballone.com.au>
ADD ansible /ansible
COPY run.sh /run.sh
RUN ["/run.sh", "-e", "build_image=true"]
ENTRYPOINT ["/run.sh"]
CMD ["/usr/sbin/mysqld"]
VOLUME ["/etc/mysql", "/var/lib/mysql", "/root"]
WORKDIR /data
EXPOSE 3306
