# Bash Scripts

I’m writing Bash scripts to automate Linux maintenance tasks in this lab. I’ll add more as I continue working on the environment and find other tasks to automate.

## Configuration Backup

[config-backup.sh](config-backup.sh) backs up ***.conf*** files before making configuration changes.

The script creates a backup directory if needed and copies each configuration file with ***.bak*** added to its name. It skips existing backups so they aren’t overwritten.

Each file’s result is recorded in ***backup-report.log***. At the end, the script displays totals for successful backups, skipped files, missing files, and failed copies. It exits with a failure status if any files are missing or fail to copy.

The script currently accepts source files by filename from the current directory.

## System Health Check

[system_health.sh](system_health.sh) checks basic Linux system health information and records the results in a log file.

The script checks system uptime, used memory, disk usage, and the status of Nginx. Each command is checked for success, and the script keeps track of how many checks pass or fail.

The collected values and final totals are written to system_health.log so the results can be reviewed later.

This script is meant to be a simple starting point for Linux monitoring and can be expanded with additional checks as the lab grows.
