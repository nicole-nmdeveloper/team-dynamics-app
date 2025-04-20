#!/bin/bash

echo "Iniciando configurações do projeto Team Dynamics App..."

if [ ! -f .env ]; then
echo "Criando arquivo .env a partir de env_example..."
cp env_example .env
fi

echo "Fazendo o build das imagens Docker..."
docker-compose build

echo "Subindo containers..."
docker-compose up -d

echo "Inicializando banco de dados..."
sleep 5

echo "Criando banco de dados e rodando migrations..."
docker-compose exec web rails db:create db:migrate

echo "Tudo pronto! Acesse o App em http://localhost:3000/"
