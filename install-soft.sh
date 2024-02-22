echo "updating repositories..." | tee -a install.log
sudo apt-get update
#sudo apt-get upgrade -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold'
echo "installing mysql" | tee -a install.log
sudo apt-get install -y mysql-server
echo "starting service ..." | tee -a install.log
sudo cp ./mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart
echo "creating the database ..." | tee -a install.log
sudo mysql -u root < ./createdbs.sql
sudo mysql -u root < ./cerbos.sql
echo "installing cerbos ..." | tee -a install.log
docker compose up
