backup="$1"

successful=0
skipped=0
missing=0
failed=0

# Require a backup directory and at least one file.
if [[ "$#" -lt 2 ]]; then
    echo "Enter backup file followed by file name(s)"
    exit 1
fi

# Create the backup directory if it doesn't exist.
if [[ ! -d "$backup" ]]; then
    if mkdir -p "$backup"; then
        echo "Backup Created: $backup"
    else
        echo "Backup Failed: $backup" >&2
        ((failed++))
        exit 1
    fi
fi

# Store the log file path.
report="$backup/backup-report.log"

# Process filenames after the first argument.
for file in "${@:2}"; do
    if [[ ! -f "$file" ]]; then
        echo "Missing file: $file" >> "$report"
        ((missing++))

    # Skip files that don't end in .conf.
    elif [[ ! "$file" == *.conf ]]; then
        echo "Skipped: $file" >> "$report"
        ((skipped++))

    # Skip files that already have a backup.
    elif [[ -f "$backup/${file}.bak" ]]; then
        echo "Backup Already Exist: $file" >> "$report"
        ((skipped++))

    else
        # Copy the file and log the result.
        if cp "$file" "$backup/${file}.bak"; then
            echo "Backup successful: ${file}.bak" >> "$report"
            ((successful++))
        else
            echo "Backup failed: $file" >> "$report"
            ((failed++))
        fi
    fi
done

# Display totals.
echo "Missing: $missing, Successful: $successful, Skipped: $skipped, Failed: $failed"

# Exit with failure if files were missing.
if [[ "$missing" -gt 0 ]]; then
    echo "Missing is greater than 0"
    exit 1
fi

# Exit with failure if any copies failed.
if [[ "$failed" -gt 0 ]]; then
    echo "Failed is greater than 0"
    exit 1
fi

exit 0
