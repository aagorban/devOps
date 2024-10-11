#!/bin/bash

sudo apt update
sudo apt install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql

DB_USER="user"
DB_PASSWORD="password"
DB_NAME="SchoolDB"

sudo mysql -e "CREATE DATABASE ${DB_NAME};"
sudo mysql -e "ALTER DATABASE ${DB_NAME} CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;"
sudo mysql -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"
sudo systemctl status mysql
echo "MySQL встановлено створений!"
