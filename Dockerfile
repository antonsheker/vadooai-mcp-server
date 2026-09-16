FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY server.py vadoo_client.py ./

RUN useradd --create-home --uid 10001 appuser && chown -R appuser:appuser /app
USER appuser

CMD ["sh", "-c", "mcp-proxy --host=0.0.0.0 --port=${PORT:-8080} --pass-environment -- python server.py"]
