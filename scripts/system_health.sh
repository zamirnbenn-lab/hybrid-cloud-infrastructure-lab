passed=0
failed=0

log_file="system_check.log"

if uptime_info=$(uptime); then
  ((++passed))
else
  echo "Uptime Check Failed" >> "$log_file"
  ((++failed))
fi

if memory_usage=$(free -h | awk '/Mem:/ {print $3}'); then 
  ((++passed))
else 
  echo "Memory Usage Check Failed" >> "$log_file"
  ((++failed))
fi 

if disk_usage=$(df -h / | awk 'NR==2 {print $5}'); then
  ((++passed))
else
  echo "Disk Usage Check Failed" >> "$log_file"
  ((++failed))
fi

if nginx_status=$(systemctl is-active nginx); then
  ((++passed))
else
  echo "Nginx Status Check Failed" >> "$log_file"
  ((++failed))
fi

echo "Uptime Info: $uptime_info" >> "$log_file"
echo "Memory Usage: $memory_usage" >> "$log_file"
echo "Disk Usage: $disk_usage" >> "$log_file"
echo "Nginx Status: $nginx_status" >> "$log_file"
echo "Passed: $passed, Failed: $failed" >> "$log_file"
