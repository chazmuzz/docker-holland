# docker-holland
Docker image for hollandbackup.org


```
docker run -d \
  -v `pwd`/holland-data/config:/etc/holland \
  -v `pwd`/holland-data/backups:/var/spool/holland \
  chazmuzz/holland 
```
