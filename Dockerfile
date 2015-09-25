FROM centos

RUN curl http://download.opensuse.org/repositories/home:/holland-backup/CentOS_7/home:holland-backup.repo > /etc/yum.repos.d/home:holland-backup.repo

RUN yum install -y holland holland-mysqldump mariadb

RUN echo "0 3 * * * /usr/sbin/holland backup >> /var/log/holland.log" > /var/spool/cron/root

VOLUME /etc/holland

VOLUME /var/spool/holland

VOLUME /var/log

RUN yum -y update && yum install -y cronie

ENTRYPOINT ["crond", "-n"]
