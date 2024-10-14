# NoSQL

## 1. Створення серверу та встановлення MongoDB

### Для встановлення MongoDB використав версію 4.4 та ubuntu/bionic64

![NoSQL](img/1.png)
![NoSQL](img/2.png)

## 2. Створення БД gymDatabase та колекцій clients, memberships, trainers, workouts

### use gymDatabase;

### db.createCollection("clients");

### db.createCollection("memberships");

### db.createCollection("workouts");

### db.createCollection("trainers");

![NoSQL](img/3.png)

## 3. Створення схеми для кожної з колекції по прикладу:

![NoSQL](img/4.png)

## 4. Добавив рандомні дані до колекцій:

![NoSQL](img/5.png)

## 5. Запити:

### - Знайдіть всіх клієнтів віком понад 30 років:

![NoSQL](img/6.png)

### - Перелічіть тренування із середньою складністю:

![NoSQL](img/7.png)

### - Покажіть інформацію про членство клієнта з певним client_id:

![NoSQL](img/8.png)
