FROM python:3.11-slim

# Create app directory and copy backend
WORKDIR /app
COPY backend/ ./backend/

# Install runtime dependencies
RUN python -m pip install --upgrade pip \
    && if [ -f backend/requirements.txt ]; then python -m pip install --no-cache-dir -r backend/requirements.txt; fi

# Set working dir into backend and default PORT
WORKDIR /app/backend
ENV PORT=8000
EXPOSE 8000

# Run uvicorn using the PORT env var
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT}"]
