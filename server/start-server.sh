#!/bin/bash

# Скрипт для запуска сервера API
echo "🚀 Запуск сервера Warehouse Management System..."

# Переходим в директорию сервера
cd "$(dirname "$0")"

# Останавливаем предыдущие процессы на порту 3001
echo "🔧 Освобождаем порт 3001..."
lsof -ti:3001 | xargs kill -9 2>/dev/null || true
pkill -f "node.*index" 2>/dev/null || true

# Ждем немного
sleep 2

# Собираем проект
echo "🔨 Сборка проекта..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Сборка завершена успешно"
    
    # Запускаем сервер
    echo "🚀 Запуск сервера..."
    node dist/index.js > server.log 2>&1 &
    
    SERVER_PID=$!
    echo "📝 PID сервера: $SERVER_PID"
    
    # Ждем запуска
    sleep 3
    
    # Проверяем, что сервер работает
    if curl -s http://localhost:3001/api/ > /dev/null; then
        echo "✅ Сервер успешно запущен!"
        echo "🌐 API доступно по адресу: http://localhost:3001/api/"
        echo "📖 Health check: http://localhost:3001/health"
        echo "📝 Логи сервера в файле: server.log"
        echo "🛑 Для остановки сервера: kill $SERVER_PID"
    else
        echo "❌ Ошибка запуска сервера. Проверьте логи в server.log"
        cat server.log
    fi
else
    echo "❌ Ошибка сборки проекта"
    exit 1
fi
