#!/bin/bash
set -e  # Зупиняє виконання скрипта при першій помилці
set -a  # Автоматично експортує змінні
source /home/ubuntu/db_setup/.env
set +a

STRUCTURE_SQL="/home/ubuntu/db_setup/structure.sql"
DATA_SQL="/home/ubuntu/db_setup/data.sql"

# Перевіряємо, чи існує база
EXISTS=$(PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d postgres -p $DB_PORT -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_NAME'")

if [[ "$EXISTS" != "1" ]]; then
  echo "База даних $DB_NAME не існує. Створюємо..."
  PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d postgres -p $DB_PORT -c "CREATE DATABASE $DB_NAME;"
else
  echo "База даних $DB_NAME вже існує."
fi

# Переконуємося, що база готова перед виконанням SQL
sleep 2

# Виконуємо SQL-скрипти
if [[ -f "$STRUCTURE_SQL" ]]; then
  echo "Імпортуємо структуру..."
  PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME -p $DB_PORT -f "$STRUCTURE_SQL"
else
  echo "Помилка: файл $STRUCTURE_SQL не знайдено!"
fi

if [[ -f "$DATA_SQL" ]]; then
  echo "Імпортуємо дані..."
  PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USER -d $DB_NAME -p $DB_PORT -f "$DATA_SQL"
else
  echo "Помилка: файл $DATA_SQL не знайдено!"
fi

echo "База даних успішно налаштована!"



