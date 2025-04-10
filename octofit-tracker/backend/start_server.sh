#!/bin/bash

PORT=8000
PID=$(lsof -t -i:$PORT)
if [ -n "$PID" ]; then
    echo "Port $PORT is in use by process $PID. Terminating..."
    kill -9 $PID
    echo "Process $PID terminated."
else
    echo "Port $PORT is free."
fi

# Start the Django development server
source venv/bin/activate
python3 manage.py runserver 0.0.0.0:$PORT