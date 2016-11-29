CREATE DATABASE testrail DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'testrail'@'localhost' IDENTIFIED BY 'newpassword';
CREATE USER 'testrail'@'%' IDENTIFIED BY 'newpassword';
GRANT ALL ON testrail.* TO 'testrail'@'localhost';
GRANT ALL ON testrail.* TO 'testrail'@'%';
