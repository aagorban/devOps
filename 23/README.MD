# AWS - S3

## 1. Створення бакету

### - aws s3api create-bucket --bucket brovary2024 --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1

## 2. Видалення бакету

### - aws s3 rm s3://brovary2024 --recursive

### - aws s3api delete-bucket --bucket brovary2024 --region eu-north-1

## 3. Завантаження файлу

### - aws s3 cp ./23/index.html s3://brovary2024/index.html

## 4. Створення policy

### - aws iam create-policy --policy-name s3-access-policy --policy-document file://s3-access-policy.json

## 5. Створення role

### - aws iam create-role --role-name myS3Role --assume-role-policy-document file://es2-assume-policy.json

## 6. Пошук

### - aws iam list-policies --query "Policies[?PolicyName=='s3-access-policy']"

## 7. Звязка policy з role

### - aws iam attach-role-policy --role-name myS3Role --policy-arn "arn:aws:iam::266735803214:policy/s3-access-policy"

## 8. Створення профайлу

### - aws iam create-instance-profile --instance-profile-name s3-profile

## 9. Звязка ролі й інстансу профайлу

### - aws iam add-role-to-instance-profile --role-name myS3Role --instance-profile-name s3-profile

## 10. Звязка інстансу профайлу з сервером

### - aws ec2 associate-iam-instance-profile --instance-id i-00833445e676a94bd --iam-instance-profile Name=s3-profile
