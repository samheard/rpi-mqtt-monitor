FROM python:3.12-alpine

# Install build tools only if install.sh needs them
RUN apk add --no-cache \
    bash \
    gcc \
    musl-dev \
    linux-headers

WORKDIR /app

# Copy the entire project
COPY . /app

# Run the project's installer
RUN chmod +x install.sh && ./install.sh

# Default command
CMD ["python3", "rpi-mqtt-monitor.py"]
