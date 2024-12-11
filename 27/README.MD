# AWS - RDS

## 1. Створення RDS інстансу в приватній підмережі.

![AWS - RDS](img/1.png)

## 2. Створення Bastion host в публічній підмережі для доступу до БД.

![AWS - RDS](img/2.png)

## 3. Підключення до БД через Bastion host та прокидання портів.

### - ssh -i "aws.pem" -L 3306:library-db.czi6k4ceafb1.eu-north-1.rds.amazonaws.com:3306 ubuntu@ec2-51-21-132-185.eu-north-1.compute.amazonaws.com

![AWS - RDS](img/3.png)
![AWS - RDS](img/4.png)
![AWS - RDS](img/5.png)

## 4. Створення БД libary, таблиць та наповнення їх даними.

![AWS - RDS](img/6.png)

## 5. Виконання запитів

![AWS - RDS](img/7.png)
![AWS - RDS](img/8.png)

## 5. Налаштування доступу

![AWS - RDS](img/9.png)

## 7. Моніторинг та резервне копіювання

![AWS - RDS](img/10.png)
![AWS - RDS](img/11.png)
