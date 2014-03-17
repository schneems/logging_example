# README

```
bin/puma -p 3000 -e production -t 6:6

tail -f log/production.log

ab -n 1000 -c 6 http://localhost.dev:3000/
```
