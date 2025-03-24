# Удаляем неиспользуемые импорты
# from fastapi import FastAPI  # ❌ Не используется
# import pytest  # ❌ Не используется

from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"Hello": "World"}


def test_read_item():
    response = client.get("/items/1")
    assert response.status_code == 200
    assert response.json() == {"item_id": 1, "q": None}

    response_with_query = client.get("/items/1?q=test")
    assert response_with_query.status_code == 200
    assert response_with_query.json() == {"item_id": 1, "q": "test"}
