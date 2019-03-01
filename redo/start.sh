#!/bin/bash

export MIX_ENV=prod
export PORT=4794

echo "Stopping old copy of app, if any..."

_build/prod/rel/redo/bin/redo stop || true

echo "Starting app..."

# Start to run in background from shell.
#_build/prod/rel/task_tracker/bin/task_tracker start

# Foreground for testing and for systemd
_build/prod/rel/redo/bin/redo foreground

# TODO: Add a cron rule or systemd service file
#       to start your app on system boot.
