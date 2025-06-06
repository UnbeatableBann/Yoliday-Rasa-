#!/bin/bash

echo "Starting Rasa and Action Server..."
rasa run actions --port 5055 &
rasa run --enable-api --cors "*" --port $PORT
