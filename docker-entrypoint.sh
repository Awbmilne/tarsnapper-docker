#!/bin/sh

# Check if the TARSNAPPER_DELTAS and TARSNAPPER_CRON environment variables are set
if [ -z "$TARSNAPPER_DELTAS" ] || [ -z "$TARSNAPPER_CRON" ]; then
  echo "Error: TARSNAPPER_DELTAS and TARSNAPPER_CRON environment variables must be set."
  exit 1
fi

# Create the /etc/cron.d/tarsnapper file with the specified schedule and command
echo "$TARSNAPPER_CRON root tarsnapper --target $TARSNAPPER_OUTPUT_DIR/$TARSNAPPER_BACKUP_NAME --sources $TARSNAPPER_SOURCES --deltas $TARSNAPPER_DELTAS >> /tarsnapper.log 2>&1" > /tarsnapper-cron

# Give execution rights on the cron job
chmod 0644 /tarsnapper-cron

# Apply cron job
crontab /tarsnapper-cron
echo "Cron job installed:"
cat /tarsnapper-cron
# Start the cron daemon in the foreground
crond -f
