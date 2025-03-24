from fastapi import FastAPI
from prometheus_client import Counter, generate_latest
from fastapi.responses import PlainTextResponse

app = FastAPI(root_path="/server1")

ITEMS_COUNTER = Counter("items_requests", "Number of requests to items endpoint")


@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    # Увеличиваем счетчик для метрик
    ITEMS_COUNTER.inc()
    return {"item_id": item_id, "q": q}

@app.get("/metrics")
def metrics():
    # Возвращаем метрики в формате для Prometheus
    return PlainTextResponse(generate_latest())
