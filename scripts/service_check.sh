service=$1

if systemctl is-active "$service"; then
  echo "$service is active"
else
  sudo systemctl restart "$service"
  echo "$service restarting"

  if systemctl is-active "$service"; then
    echo "$service is now active"
  else
    echo "$service restart failed"
  fi
fi
