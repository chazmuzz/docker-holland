FROM centos

RUN curl http://download.opensuse.org/repositories/home:/holland-backup/CentOS_7/home:holland-backup.repo > /etc/yum.repos.d/home:holland-backup.repo

RUN yum install -y holland holland-mysqldump

RUN mkdir /etc/cron.d && echo "0 3 * * * /usr/sbin/holland -q bk" > /etc/cron.d/holland-cron

VOLUME /etc/holland

VOLUME /var/spool/holland

VOLUME /var/log
