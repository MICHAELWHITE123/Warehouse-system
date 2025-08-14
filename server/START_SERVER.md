# 🚀 Запуск сервера API

## Быстрый старт

### 1. Убедитесь, что находитесь в правильной директории:
```bash
cd /Users/ml/Documents/WeareHouse/server
```

### 2. Запустите сервер одним из способов:

#### 🚀 ПРОСТОЙ СПОСОБ (рекомендуется):
```bash
./start-server.sh
```

#### 🛑 Остановка сервера:
```bash
./stop-server.sh
```

#### Альтернативные способы:

**Разработка (с автоперезагрузкой):**
```bash
npm run dev
```

**Продакшен (скомпилированная версия):**
```bash
npm run build && npm start
```

**Быстрый запуск (скомпилированная версия):**
```bash
node dist/index.js
```

## 🌐 Endpoints

После запуска сервер будет доступен по адресу: `http://localhost:3001`

### Тестовые endpoints:
- **Главная страница:** `http://localhost:3001/`
- **API список:** `http://localhost:3001/api/`
- **Health check:** `http://localhost:3001/health`

### API endpoints:
- `POST /api/auth/register` - Регистрация
- `POST /api/auth/login` - Авторизация
- `GET /api/categories` - Категории (требует токен)
- `GET /api/equipment` - Оборудование (требует токен)
- `GET /api/statistics` - Статистика (требует токен)

## 🔧 Отладка

Если возникают проблемы:

1. **Порт занят:** Остановите процесс на порту 3001:
   ```bash
   lsof -ti:3001 | xargs kill -9
   ```

2. **База данных:** Проверьте настройки в файле `.env`

3. **Зависимости:** Переустановите модули:
   ```bash
   npm install
   ```

## ✅ Проверка работы

### Быстрая проверка API:
```bash
curl http://localhost:3001/api/
```

Ожидаемый ответ:
```json
{
  "success": true,
  "message": "API is working",
  "routes": ["/auth", "/users", "/categories", "/locations", "/equipment", "/stacks", "/shipments", "/statistics"]
}
```

### 🧪 Полное тестирование API:
```bash
./test-api.sh
```

Этот скрипт проверит:
- ✅ Статус сервера
- ✅ Работу API endpoints
- ✅ Health check
- ✅ Подключение к базе данных
- ✅ Регистрацию пользователей
- ✅ Авторизацию
- ✅ Защищенные endpoints

## 📖 Полная документация

Смотрите файл `API_ENDPOINTS.md` для полного списка всех endpoints и их использования.
