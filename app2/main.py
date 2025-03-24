from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from fastapi.middleware.cors import CORSMiddleware
from prometheus_client import Counter, generate_latest
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(root_path="/server2")

origins = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

ITEMS_COUNTER = Counter("items_requests", "Number of requests to items endpoint")

@app.get("/")
def read_root():
    logger.info("Root endpoint called")
    return {"Hello": "project 2"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    logger.info(f"Items endpoint called with item_id: {item_id} and query: {q}")
    ITEMS_COUNTER.inc()
    return {"item_id": item_id, "q": q}

@app.get("/metrics")
def metrics():
    logger.info("Metrics endpoint called")
    return PlainTextResponse(generate_latest())
