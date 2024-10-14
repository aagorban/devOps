#!/bin/bash

# Оновлення пакетів
sudo apt-get update
sudo apt-get install -y gnupg wget

# Додавання ключа для MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Додавання репозиторію MongoDB 4.4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Оновлення списків пакетів
sudo apt-get update

# Встановлення MongoDB 4.4
sudo apt-get install -y mongodb-org

# Запуск MongoDB та включення його автозапуску
sudo systemctl start mongod
sudo systemctl enable mongod

# Затримка на 5 секунд для запуску сервісу
sleep 5

# Створення адміністративного користувача
mongo <<EOF
use admin
db.createUser({
  user: "admin",
  pwd: "password",
  roles: [{ role: "root", db: "admin" }]
})
EOF

# Повідомлення про успішну установку
echo "MongoDB встановлено та користувача створено."

# Перевірка статусу MongoDB
sudo systemctl status mongod
