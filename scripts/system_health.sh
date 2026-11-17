passed=0
failed=0

check="system_check.log"

if uptime_info=$(uptime); then
  ((++passed))
else
  echo "Uptime Check Failed" >> "$check"
  ((++failed))
fi

if memory_usage=$(free -h | awk '/Mem:/ {print $3}'); then 
  ((++passed))
else 
  echo "Memory Usage Check Failed" >> "$check"
  ((++failed))
fi 

if disk_usage=$(df -h / | awk 'NR==2 {print $5}'); then
  ((++passed))
else
  echo "Disk Usage Check Failed" >> "$check"
  ((++failed))
fi

if nginx_status=$(systemctl is-active nginx); then
  ((++passed))
else
  echo "Nginx Status Check Failed" >> "$check"
  ((++failed))
fi

echo "Uptime Info: $uptime_info" >> "$check"
echo "Memory Usage: $memory_usage" >> "$check"
echo "Disk Usage: $disk_usage" >> "$check"
echo "Nginx Status: $nginx_status" >> "$check"
echo "Passed: $passed, Failed: $failed" >> "$check"
