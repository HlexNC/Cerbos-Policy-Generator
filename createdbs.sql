create database if not exists cerbos;
drop database  cerbos;
create database cerbos;
create user if not exists 'accelerate'@'%' identified WITH mysql_native_password BY 'accelerate';
grant all privileges on cerbos.* to 'accelerate'@'%';