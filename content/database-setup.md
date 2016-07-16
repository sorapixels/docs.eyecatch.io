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

To use PostgreSQL, add the following to your configuration.

```ruby
service 'postgresql'
```

PostgreSQL server will listen on `127.0.0.1:5432`.  
The users `postgres` and `root` with blank password can be used for authentication.  


### MySQL

To use MySQL, add the following to your configuration.

```ruby
service 'mysql'
```

MySQL server will listen on `127.0.0.1:3306`.  
The user `root` with blank password can be used for authentication.

### MongoDB

To use MongoDB, add the following to your configuration.

```ruby
service 'mongodb'
```

MongoDB server will listen on `127.0.0.1:27017` and can be accessed
without authentication.

### Redis

To use Redis, add the following to your configuration.

```ruby
service 'redis'
```

Redis server will listen on `127.0.0.1:6379` and can be accessed without password.
