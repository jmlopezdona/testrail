# Using Docker Compose (recommended way)

```bash
docker-compose up
```
1. URL: http://localhost:1234/testrail
2. You have to fill in the initial configuration form:
  - Driver: mysql
  - Database: testrail
  - User database: testrail
  - Password database: newpassword
  - Logs folder: /opt/testrail/logs
  - Attachments folder: /opt/testrail/attachments
  - Reports folder: /opt/testrail/reports

# Manual Docker

## Create mysql container
```bash
docker build -t jmlopezdona/testrail-mysql:latest ./mysql
  docker run --name testrail-mysql -v /var/lib/mysql -e MYSQL_ROOT_PASSWORD=mypassword -d jmlopezdona/testrail-mysql:latest
```

## Create apache2 + php container

```bash
docker build -t jmlopezdona/testrail:latest ./apache2
docker run --name testrail -p 1234:80 --link testrail-mysql:mysql -d -v /var/www/html jmlopezdona/testrail:latest
```
