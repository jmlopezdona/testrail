# Testrail instance using Docker

Previously, you need to purchase a license or [get a trial](https://secure.gurock.com/customers/testrail/trial/)

## Using Docker Compose (recommended option)

```bash
docker-compose up
```

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

## Initial configuration

1. Access to testrail instance: [http://localhost:1234/testrail](http://localhost:1234/testrail)
2. Fill in the form:
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

## Reset instalation

The configuration and data are keep in mysql database and config.php file in (/var/www/http/testrail) the apache server, although docker instances are been stopped or removed. If you need reinstall or reset the instalation, you need remove mysql and apache docker volumes (note: before you need stop and/or remove docker instances)

```
docker volume rm testrail testrail-mysql
```
