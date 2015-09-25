# docker-holland
Docker image for hollandbackup.org


```
docker run -d -v `pwd`/holland-data:/etc/holland -v `pwd`/backups:/var/spool/holland chazmuzz/holland 
```
