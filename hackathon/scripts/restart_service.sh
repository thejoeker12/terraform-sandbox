#!/bin/bash
# Restart a macOS service by name
SERVICE="$4" # Passed from Jamf parameter 4

if [[ -z "$SERVICE" ]]; then
  echo "Error: No service specified."
  exit 1
fi

/bin/launchctl kickstart -k system/"$SERVICE" || {
  echo "Failed to restart $SERVICE"
  exit 1
}

echo "$SERVICE restarted successfully."
exit 0
