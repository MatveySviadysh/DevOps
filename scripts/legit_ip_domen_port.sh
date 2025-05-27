#!/bin/bash

# Цвета
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Без цвета

# Проверка наличия аргументов
if [ "$#" -lt 3 ]; then
  echo -e "${RED}Usage: $0 <domain> <ip_address> <port>${NC}"
  exit 1
fi

DOMAIN=$1
IP=$2
PORT=$3

# Проверка доступности доменного имени
echo "🔍 Проверка доступности домена: $DOMAIN"
ping -c 2 $DOMAIN > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Домен $DOMAIN доступен${NC}"
else
  echo -e "${RED}❌ Домен $DOMAIN недоступен${NC}"
fi

# Проверка доступности IP-адреса
echo "🔍 Проверка доступности IP: $IP"
ping -c 2 $IP > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ IP $IP доступен${NC}"
else
  echo -e "${RED}❌ IP $IP недоступен${NC}"
fi

# Проверка открытого порта
echo "🔍 Проверка порта $PORT на $IP"
nc -zv $IP $PORT > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Порт $PORT на $IP открыт${NC}"
else
  echo -e "${RED}❌ Порт $PORT на $IP закрыт или недоступен${NC}"
fi
