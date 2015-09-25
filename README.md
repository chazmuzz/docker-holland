# docker-holland
Docker image for hollandbackup.org

Uses cron to run a holland backup daily at 3am


```
docker run -d \
  -v `pwd`/holland-data/config:/etc/holland \
  -v `pwd`/holland-data/backups:/var/spool/holland \
  chazmuzz/holland 
```
