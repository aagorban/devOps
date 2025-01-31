# AWS Lambda

## 1. Підготовка DynamoDB:
### - В AWS console створив таблицю Users.
![Lambda](img/1.png)

## 2. Налаштування DynamoDB Streams:
### - Активував DynamoDB Streams для таблиці Users.
![Lambda](img/2.png)

## 3. Створення Lambda-функції:
### - В AWS console створив нову Lambda, додав тригер та створив роль.
![Lambda](img/3.png)
![Lambda](img/4.png)

## 4. Налаштування Amazon SES:
### - Підтвердив електронну адресу.
![Lambda](img/5.png)

## 5. Написання коду Lambda-функції
### - Створив файл index.mjs, в якому зробив обробку події створення чи редагування елементу таблиці User.
### - В результаті при додаванні або редагуванні елементу, на електронну адресу приходить відповідне повідомлення.
![Lambda](img/6.png)
![Lambda](img/7.png)