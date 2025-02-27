#!/bin/bash

dbus-run-session code --no-sandbox

# Wait for 'code-oss' process to start
while ! pgrep -x code-oss > /dev/null; do
  sleep 1
done

# Wait for 'code-oss' process to finish
while pgrep -x code-oss > /dev/null; do
  sleep 1 # Check every 1 second
done