# Terraform & Yandex Cloud — Two VMs

[![Terraform](https://img.shields.io/badge/Terraform-1.5+-purple.svg)](https://www.terraform.io)
[![Yandex.Cloud](https://img.shields.io/badge/Yandex.Cloud-API-blue.svg)](https://cloud.yandex.ru)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📋 О проекте

Этот проект демонстрирует создание виртуальной инфраструктуры в **Yandex Cloud** с помощью **Terraform** (Infrastructure as Code).

**Что создаётся:**
- 🌐 VPC сеть и подсеть (`192.168.10.0/24`)
- 💾 2 загрузочных диска (20 GB, network-hdd)
- 🖥️ 2 виртуальные машины:
  - `terraform1` — 2 vCPU, 2 GB RAM
  - `terraform2` — 2 vCPU, 2 GB RAM
- 🔑 SSH доступ на обе ВМ

**Особенности:**
- Многие параметры вынесены в переменные
- Диски создаются отдельно от ВМ (можно переиспользовать)
- Настроен публичный доступ (NAT)

---

## 🛠️ Требования

| Инструмент | Версия |
|-----------|--------|
| Terraform | >= 0.13 |
| Yandex Cloud CLI | любая |
| Git | любая |

А также:
- Аккаунт в [Yandex Cloud](https://cloud.yandex.ru)
- Сервисный аккаунт с правами `editor`

---

## 🚀 Быстрый старт

### 1. Клонируйте репозиторий

```bash
git clone https://github.com/your-username/terraform-yandex-two-vms.git
cd terraform-yandex-two-vms
```

### 2. Авторизуйтесь в Yandex Cloud с локальной машины
```bash
yc init
```

### 3. Создайте сервисный аккаунт
```bash
yc iam service-account create \
  --name terraform-robot \
  --description "Сервисный аккаунт для Terraform"
```

### 4. Добавьте права редактора в ваш каталог
```bash
yc resource-manager folder add-access-binding \
  --name default \
  --role editor \
  --subject serviceAccount:$(yc iam service-account get terraform-robot --format json | jq -r .id)
```
### 5. Создайте папку для ключа
```bash
mkdir keys
```

### 6. Сгенерируйте авторизованный ключ
```bash
yc iam key create --service-account-name terraform-robot --output keys/sa-key.json
```

### 7. Узнайте ID облака и директории (обязательно вставьте значения в переменные файла variables.tf)
```bash
# Узнать ID облака
yc resource-manager cloud list

# Узнать ID каталога (папки)
yc resource-manager folder list
```

### 8. Запустите Terraform
```bash
# Инициализация (скачает провайдера)
terraform init

# План (посмотрим что будет создано)
terraform plan

# Создаём окружение
terraform apply

# Когда спросит "Do you want to perform these actions?" - введи "yes"
```

### 9. Как удалить всё
```bash
terraform destroy
```
