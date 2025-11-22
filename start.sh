#!/usr/bin/env bash
# Simple start script for Railway / Railpack
# - changes into the backend dir
# - installs dependencies
# - starts uvicorn using the PORT env var provided by Railway

set -euo pipefail

cd "$(dirname "$0")/backend"

# Prefer dependencies to be installed during the build step. If they are
# missing at runtime try to install using whichever pip is available.
if [ -f "requirements.txt" ]; then
  if command -v pip >/dev/null 2>&1; then
    pip install --no-cache-dir -r requirements.txt || true
  elif command -v python >/dev/null 2>&1; then
    python -m pip install --no-cache-dir -r requirements.txt || true
  elif command -v python3 >/dev/null 2>&1; then
    python3 -m pip install --no-cache-dir -r requirements.txt || true
  else
    >&2 echo "Warning: no pip or python found — skipping runtime install."
  fi
fi

# Start the FastAPI app. Use main:app by default.
exec uvicorn main:app --host 0.0.0.0 --port "${PORT:-8000}"
