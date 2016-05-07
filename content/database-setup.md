---
layout: default
permalink: /database-setup
---

Database setup
===

Eyecatch build environment has some database servers which can be started manually.
Following databases are installed:

- PostgreSQL
- MySQL
- MongoDB
- Redis

### PostgreSQL
PostgreSQL server can be started manually and it will listen on `127.0.0.1:5432`.
There is a user `postgres` and `root` with blank password for authentication.
You can create a new user anytime.

```bash
$ /etc/init.d/postgresql start
$ psql -c 'create database awesomedb;' -U postgres
```

### MySQL
MySQL server can be started manually and it will listen on `127.0.0.1:3306`.

```bash
$ /etc/init.d/mysql start
$ mysql -u root -e 'create database awesomedb;'
```

### MongoDB
MongoDB server will listen on `127.0.0.1:27017`.

```bash
$ /etc/init.d/mongodb start
```


### Redis
Redis server will listen on `127.0.0.1:6379`.

```bash
$ /etc/init.d/redis-server start
```
