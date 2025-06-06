FROM rasa/rasa:3.6.21

# Set working directory
WORKDIR /app

# Copy all files to container
COPY . /app

# Install extra dependencies (run as root)
USER root
# Fix: Use --no-install-recommends and ensure permissions
RUN apt-get update && \
    apt-get install --no-install-recommends -y gcc make libpq-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make script executable
RUN chmod +x start.sh

# Expose ports
EXPOSE 5005 5055

# Start the bot
ENTRYPOINT ["/bin/bash", "start.sh"]
