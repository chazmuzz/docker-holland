# Docker Holland

Docker image for http://hollandbackup.org

Runs a holland backup at 3am daily. Does not use cron, instead just uses a bash script to sleep until 3am the next day.

```
docker run -d \
  -v `pwd`/holland-data/config:/etc/holland \
  -v `pwd`/holland-data/backups:/var/spool/holland \
  chazmuzz/holland 
```
