FROM python:3.12-alpine

# Install build tools needed for psutil
RUN apk add --no-cache \
    gcc \
    musl-dev \
    linux-headers \
    sudo

WORKDIR /app

# Only copy what the container needs
COPY requirements.txt /app/requirements.txt
COPY src/ /app/src/
# COPY config.py /app/src/config.py  # fallback config baked into image - it is already in the /app/src

# Install Python dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Default command: run the monitor script
CMD ["python3", "/app/src/rpi-cpu2mqtt.py"]
