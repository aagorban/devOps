# AWS - Basic

## 1. Створення та налаштування VPC

### - Створив через консоль AWS VPC з однією публічною та приватною підмережами.

![AWS - Basic](img/1.png)
![AWS - Basic](img/2.png)
![AWS - Basic](img/3.png)

## 2. Налаштування груп безпеки (Security Groups)

![AWS - Basic](img/4.png)

## 3. Запуск інстансу EC2

### - Створив інстанс EC2 Amazon Linux 2 AMI з типом t3.micro.

### - Прив'язав до публічної мережі.

### - Створив SSH-ключ для доступу до інстансу.

![AWS - Basic](img/5.png)
![AWS - Basic](img/6.png)
![AWS - Basic](img/7.png)

## 4. Призначення еластичної IP-адреси (EIP)

### - Створив нову EIP в AWS консолі та прив'язав до створеного інстансу.

![AWS - Basic](img/8.png)

### - Додав в Security Groups правило All ICMP - IPv4, щоб можна було зробити psng.

![AWS - Basic](img/9.png)
