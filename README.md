# Testrail instance using Docker

Previously, you need to purchase a license or [get a trial](https://secure.gurock.com/customers/testrail/trial/)

## Using Docker Compose (recommended way)

```bash
docker-compose up
```
1. URL: [http://localhost:1234/testrail](http://localhost:1234/testrail)
2. You have to fill in the initial configuration form:
  - Database Settings:
    - Driver: MySQL (5.x and higher)
    - Server: mysql
    - Database: testrail
    - User: testrail
    - Password database: newpassword
  - Application Settings:
    - Attachments folder: /opt/testrail/attachments
    - Reports folder: /opt/testrail/reports
    - Logs folder: /opt/testrail/logs
  - Administrator Account:
    - Full Name
    - Email Address
    - Password
    - License Key

## Using Docker

### Create mysql container
```bash
docker build -t jmlopezdona/testrail-mysql:latest ./mysql
docker run --name testrail-mysql -v testrail-mysql/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mypassword -d jmlopezdona/testrail-mysql:latest
```

### Create apache2 + php container

```bash
docker build -t jmlopezdona/testrail:latest ./apache2
docker run --name testrail -p 1234:80 --link testrail-mysql:mysql -d -v testrail/var/www/html jmlopezdona/testrail:latest
```

## Reset instalation

You need remove mysql and apache docker volumes (before you need stop docker instances)

```
docker volume rm testrail testrail-mysql
```
