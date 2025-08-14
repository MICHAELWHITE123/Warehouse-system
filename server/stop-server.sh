#!/bin/bash

# Скрипт для остановки сервера API
echo "🛑 Остановка сервера Warehouse Management System..."

# Останавливаем процессы на порту 3001
echo "🔧 Останавливаем процессы на порту 3001..."
lsof -ti:3001 | xargs kill -9 2>/dev/null || true

# Останавливаем все связанные процессы Node.js
echo "🔧 Останавливаем связанные процессы..."
pkill -f "node.*index" 2>/dev/null || true
pkill -f "nodemon" 2>/dev/null || true

echo "✅ Сервер остановлен"
