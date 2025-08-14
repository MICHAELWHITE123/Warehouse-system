# Warehouse Management System - Server

Серверная часть системы учета техники на складе, построенная на Node.js, Express.js и PostgreSQL.

## 🚀 Быстрый старт

### 1. Установка PostgreSQL

#### macOS (с Homebrew):
```bash
brew install postgresql
brew services start postgresql
```

#### Ubuntu/Debian:
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

#### Windows:
Скачайте и установите PostgreSQL с [официального сайта](https://www.postgresql.org/download/windows/)

### 2. Настройка базы данных

```bash
# Подключение к PostgreSQL
sudo -u postgres psql

# Создание пользователя и базы данных
CREATE USER warehouse_user WITH PASSWORD 'your_password_here';
CREATE DATABASE warehouse_db OWNER warehouse_user;
GRANT ALL PRIVILEGES ON DATABASE warehouse_db TO warehouse_user;

# Выход из psql
\q
```

### 3. Настройка переменных окружения

```bash
# Скопируйте файл примера
cp env.example .env

# Отредактируйте .env файл
nano .env
```

Пример `.env` файла:
```env
# Database Configuration
DB_HOST=localhost
DB_PORT=5432
DB_NAME=warehouse_db
DB_USER=warehouse_user
DB_PASSWORD=your_password_here

# Server Configuration
PORT=3001
NODE_ENV=development

# JWT Configuration
JWT_SECRET=your_super_secret_jwt_key_here
JWT_EXPIRES_IN=7d

# CORS Configuration
CORS_ORIGIN=http://localhost:5173
```

### 4. Установка зависимостей и запуск

```bash
# Установка зависимостей
npm install

# Запуск в режиме разработки
npm run dev

# Сборка проекта
npm run build

# Запуск в продакшене
npm start
```

## 📊 База данных

### Автоматические миграции

При первом запуске сервер автоматически:
1. Создаст все необходимые таблицы
2. Настроит индексы и триггеры
3. Заполнит базу начальными данными
4. Создаст администратора по умолчанию

### Учетная запись администратора по умолчанию

```
Логин: admin
Пароль: admin123
Email: admin@warehouse.local
```

⚠️ **Важно!** Обязательно смените пароль администратора после первого входа в систему.

### Структура таблиц

- `users` - Пользователи системы
- `categories` - Категории оборудования
- `locations` - Местоположения
- `equipment` - Оборудование
- `equipment_stacks` - Стеки оборудования
- `stack_equipment` - Связь стеков и оборудования
- `shipments` - Отгрузки
- `shipment_equipment` - Оборудование в отгрузках
- `shipment_stacks` - Стеки в отгрузках
- `shipment_checklist` - Чек-листы отгрузок
- `shipment_rental` - Аренда оборудования
- `audit_log` - Журнал изменений

## 🔧 API Endpoints

### Проверка состояния
- `GET /` - Информация о API
- `GET /health` - Проверка состояния сервера и БД

### Пользователи
- `POST /api/auth/login` - Вход в систему
- `POST /api/auth/register` - Регистрация
- `GET /api/auth/me` - Информация о текущем пользователе

### Оборудование
- `GET /api/equipment` - Список оборудования
- `POST /api/equipment` - Создание оборудования
- `PUT /api/equipment/:id` - Обновление оборудования
- `DELETE /api/equipment/:id` - Удаление оборудования

### Категории
- `GET /api/categories` - Список категорий
- `POST /api/categories` - Создание категории
- `PUT /api/categories/:id` - Обновление категории
- `DELETE /api/categories/:id` - Удаление категории

### Местоположения
- `GET /api/locations` - Список местоположений
- `POST /api/locations` - Создание местоположения
- `PUT /api/locations/:id` - Обновление местоположения
- `DELETE /api/locations/:id` - Удаление местоположения

### Стеки оборудования
- `GET /api/stacks` - Список стеков
- `POST /api/stacks` - Создание стека
- `PUT /api/stacks/:id` - Обновление стека
- `DELETE /api/stacks/:id` - Удаление стека

### Отгрузки
- `GET /api/shipments` - Список отгрузок
- `POST /api/shipments` - Создание отгрузки
- `PUT /api/shipments/:id` - Обновление отгрузки
- `DELETE /api/shipments/:id` - Удаление отгрузки

### Статистика
- `GET /api/statistics` - Общая статистика системы

## 🔒 Безопасность

- JWT токены для аутентификации
- Bcrypt для хеширования паролей
- Helmet для защиты HTTP заголовков
- CORS для контроля доступа
- Валидация входных данных

## 📝 Логирование

Система использует Morgan для логирования HTTP запросов и встроенную систему логирования для внутренних операций.

## 🚧 Разработка

### Структура проекта

```
server/
├── src/
│   ├── config/         # Конфигурация (БД, настройки)
│   ├── controllers/    # Контроллеры API
│   ├── database/       # Миграции и утилиты БД
│   ├── middleware/     # Middleware функции
│   ├── models/         # Модели данных
│   ├── routes/         # Маршруты API
│   ├── types/          # TypeScript типы
│   ├── utils/          # Утилиты
│   └── index.ts        # Точка входа
├── dist/               # Скомпилированный код
├── package.json
├── tsconfig.json
└── README.md
```

### Команды разработки

```bash
npm run dev          # Запуск в режиме разработки с автоперезагрузкой
npm run build        # Сборка TypeScript в JavaScript
npm run start        # Запуск собранного приложения
```

## 🐳 Docker (в разработке)

```bash
# Сборка Docker образа
docker build -t warehouse-server .

# Запуск с Docker Compose
docker-compose up -d
```

## 📞 Поддержка

При возникновении проблем:

1. Проверьте логи сервера
2. Убедитесь, что PostgreSQL запущен
3. Проверьте правильность настроек в `.env`
4. Убедитесь, что все зависимости установлены

## 📄 Лиценза

MIT License
