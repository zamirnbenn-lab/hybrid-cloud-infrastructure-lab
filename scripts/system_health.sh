passed=0
failed=0

if uptime_info=$(uptime); then
  ((++passed))
else
  echo "Uptime Check Failed" >> system_health.log
  ((++failed))
fi

if memory_usage=$(free -h | awk '/Mem:/ {print $3}'); then 
  ((++passed))
else 
  echo "Memory Usage Check Failed" >> system_health.log
  ((++failed))
fi 

if disk_usage=$(df -h / | awk 'NR==2 {print $5}'); then
  ((++passed))
else
  echo "Disk Usage Check Failed" >> system_health.log
  ((++failed))
fi

if nginx_status=$(systemctl is-active nginx); then
  ((++passed))
else
  echo "Nginx Status Check Failed" >> system_health.log
  ((++failed))
fi

echo "Uptime Info: $uptime_info" >> system_health.log
echo "Memory Usage: $memory_usage" >> system_health.log
echo "Disk Usage: $disk_usage" >> system_health.log
echo "Nginx Status: $nginx_status" >> system_health.log
echo "Passed: $passed, Failed: $failed" >> system_health.log
