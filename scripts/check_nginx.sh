#!/bin/bash
if pgrep nginx > /dev/null; then
  echo "Nginx is running"
else
  echo "Nginx is not running"
  systemctl start nginx
fi
