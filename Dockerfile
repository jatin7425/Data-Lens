FROM python:3.11-slim

WORKDIR /app
COPY backend/ ./backend/

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r backend/requirements.txt

WORKDIR /app/backend

# DO NOT SET PORT manually, Railway will provide $PORT
EXPOSE 3000

# Start using Railway's injected $PORT
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port $PORT"]
