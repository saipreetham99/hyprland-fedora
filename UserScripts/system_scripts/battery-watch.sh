#!/usr/bin/env bash
# Battery notifier for Fedora + Hyprland (Wayland)
# Alerts at 30% (low) and 15% (critical). Sends alert even if already low at login.

BAT_PATH="/sys/class/power_supply/BAT0"
THRESHOLD_LOW=30
THRESHOLD_CRIT=15
RESET_MARGIN=5 # clear alerts after charging above LOW+margin
INTERVAL=60    # seconds
SOUND_LOW="/usr/share/sounds/freedesktop/stereo/bell.oga"
SOUND_CRIT="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"

# Fallback to BAT1 if needed
[ -d "$BAT_PATH" ] || BAT_PATH="/sys/class/power_supply/BAT1"

notified_low=0
notified_crit=0

send_alert() {
  # $1=urgency, $2=title, $3=body, $4=sound
  notify-send -u "$1" "$2" "$3"
  paplay "$4" 2>/dev/null &
}

while :; do
  if [ -r "$BAT_PATH/capacity" ] && [ -r "$BAT_PATH/status" ]; then
    capacity=$(cat "$BAT_PATH/capacity")
    status=$(cat "$BAT_PATH/status")

    if [ "$status" = "Discharging" ]; then
      # Critical first
      if [ "$capacity" -lt "$THRESHOLD_CRIT" ] && [ "$notified_crit" -eq 0 ]; then
        send_alert critical "Battery CRITICAL 🔋" "Battery at ${capacity}% — plug in now." "$SOUND_CRIT"
        notified_crit=1
      fi

      # Low (only if not already critical)
      if [ "$capacity" -lt "$THRESHOLD_LOW" ] && [ "$capacity" -ge "$THRESHOLD_CRIT" ] && [ "$notified_low" -eq 0 ]; then
        send_alert normal "Battery low" "Battery at ${capacity}%." "$SOUND_LOW"
        notified_low=1
      fi
    fi

    # Reset alerts after you’re safe again (charging or well above LOW+margin)
    if [ "$status" = "Charging" ] || [ "$capacity" -ge $((THRESHOLD_LOW + RESET_MARGIN)) ]; then
      notified_low=0
      notified_crit=0
    fi
  fi

  sleep "$INTERVAL"
done
