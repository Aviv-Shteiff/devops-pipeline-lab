#!/bin/bash

set -e

MAX_ATTEMPTS=10
SLEEP_SECONDS=2

for i in $(seq 1 "$MAX_ATTEMPTS"); do
    
    CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health) || true
    echo "Attempt $i: got $CODE"

    if [ "$CODE" -eq 200 ]; then
        echo "OK"
        exit 0
    else
        if [ "$i" -eq "$MAX_ATTEMPTS" ]; then
            break
        fi
        sleep "$SLEEP_SECONDS"
    fi

done

echo "FAIL: last code was $CODE"
exit 1