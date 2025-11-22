#!/usr/bin/env bash
# Simple start script for Railway / Railpack
# - changes into the backend dir
# - installs dependencies
# - starts uvicorn using the PORT env var provided by Railway

set -euo pipefail

cd "$(dirname "$0")/backend"

# Install dependencies (use --no-cache-dir for smaller build artifacts)
if [ -f "requirements.txt" ]; then
  pip install --no-cache-dir -r requirements.txt
fi

# Start the FastAPI app. Use main:app by default.
exec uvicorn main:app --host 0.0.0.0 --port "${PORT:-8000}"
