#!/bin/bash

echo "Starting Rasa and Action Server..."
echo "Rasa port: $PORT"
rasa run actions --port 5055 &
rasa run --enable-api --cors "*" --port $PORT
