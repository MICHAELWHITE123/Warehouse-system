#!/bin/bash

echo "🚀 Запуск деплоя на Vercel + Supabase..."

# Проверка наличия Vercel CLI
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI не установлен. Устанавливаем..."
    npm install -g vercel
fi

# Проверка наличия .env файла
if [ ! -f .env ]; then
    echo "⚠️  Файл .env не найден. Создайте его на основе env.example"
    echo "📝 Скопируйте env.example в .env и заполните переменные"
    exit 1
fi

# Установка зависимостей
echo "📦 Устанавливаем зависимости..."
npm install

# Сборка frontend
echo "🔨 Собираем frontend..."
npm run build

# Деплой на Vercel
echo "🚀 Деплоим на Vercel..."
vercel --prod

echo "✅ Деплой завершен!"
echo "🌐 Ваше приложение доступно по адресу выше"
echo "📊 Проверьте логи в Vercel Dashboard"
