#!/bin/bash

SERVER="192.168.1.38:5000"
IMAGE_NAME=$(basename "$PWD")
TAG="latest"
FULL_IMAGE_PATH="$SERVER/$IMAGE_NAME:$TAG"

echo "Начинаю сборку образа: $FULL_IMAGE_PATH"

docker build -t "$FULL_IMAGE_PATH" .

if [ $? -eq 0 ]; then
    echo "Сборка завершена успешно!"
else
    echo "Ошибка при сборке!"
    exit 1
fi

echo "Отправляю образ в Registry..."
docker push "$FULL_IMAGE_PATH"

if [ $? -eq 0 ]; then
    echo "Всё готово! Образ на сервере."
else
    echo "Ошибка при отправке в Registry!"
    exit 1
fi