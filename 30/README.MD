# AWS - Advanced Terraform

## 1. Створив три модулі в папці modules: vpc, subnet, ec2.
### - Виконав команду "terraform init", "terraform fmt", "terraform validate" та "terraform apply".

![AWS - Advanced Terraform](img/1.png)
![AWS - Advanced Terraform](img/2.png)
![AWS - Advanced Terraform](img/3.png)

### - Видалив створені ресурси командою "terraform destroy".

## 2. Створив в AWS console S3 bucket "bro-bucket1010".
### - Додав ресурс S3 bucket до main.tf.
### - Виконав команду terraform import aws_s3_bucket.imported_bucket bro-bucket1010.
![AWS - Advanced Terraform](img/4.png)

### - Перевірив атрибути ресурсу "terraform show".
![AWS - Advanced Terraform](img/5.png)

### - Перевірив план "terraform plan".
![AWS - Advanced Terraform](img/6.png)

### - Виконав "terraform apply".
![AWS - Advanced Terraform](img/7.png)

## 3. Видалив всю інфраструктуру, в тому числі і S3 bucket, за допомогою команди "terraform destroy".