# AWS - EKS

## 1. Створення кластеру EKS

### - встановлення eksctl:

![AWS - EKS](img/1.png)

### - створення кластеру за допомогою CLI:

#### eksctl create cluster --name bro-eks-cluster --version 1.27 --region eu-north-1 --nodegroup-name bro-workers --node-type t3.medium --nodes 2 --nodes-min 2 --nodes-max 4 --managed

![AWS - EKS](img/2.png)
![AWS - EKS](img/3.png)
![AWS - EKS](img/4.png)
![AWS - EKS](img/5.png)

## 2. Налаштування kubectl для доступу до кластера

### - aws eks update-kubeconfig --region eu-north-1 --name bro-eks-cluster

![AWS - EKS](img/6.png)

## 3. Розгортання статичного вебсайту

### - Створення deployment.yaml, configmap.yaml та service.yaml.

### - kubectl apply -f configmap.yaml

### - kubectl apply -f deployment.yaml

### - kubectl apply -f service.yaml

![AWS - EKS](img/7.png)
![AWS - EKS](img/8.png)
![AWS - EKS](img/9.png)

## 4. Створення PersistentVolumeClaim для збереження даних.

### - Створення storageclass.yaml, pv.yaml та pvc.yaml.

![AWS - EKS](img/10.png)

### - Створення Pod, що використовує VPC за допомогою файлу pod.yaml. Pod створилася, але чомусь не змогла приєднати my-pvc.

![AWS - EKS](img/11.png)
![AWS - EKS](img/12.png)

## 5. Запуск завдання за допомогою Job

### - Створення job.yaml та його запуск.

![AWS - EKS](img/13.png)

## 6. Розгортання тестового застосунку

### - Створення deployment-app.yaml та service-app.yaml.

![AWS - EKS](img/14.png)
![AWS - EKS](img/15.png)
![AWS - EKS](img/16.png)

## 7. Створення namespace

### - Створення namespace.yaml та його запуск kubectl apply -f namespace.yaml.

### - Створення dev-deployment.yaml та його запуск kubectl apply -f dev-deployment.yaml.

![AWS - EKS](img/17.png)

## 8. Очистка ресурсів

![AWS - EKS](img/18.png)
![AWS - EKS](img/19.png)

### - Видалення кластера eksctl delete cluster --name bro-eks-cluster --region eu-north-1
