# Quota Check Script

This Bash script checks the number of files and their total size in each top-level directory within a specified directory or the user's scratch directory (default: `$SCRATCH`). It also calculates the percentage of used file quota.

## Usage

1. Make the script executable by running the command: `chmod +x quota_check.sh`.
2. Run the script without an argument to check the default directory: `./quota_check.sh`. Or
3. Run the script with a directory argument to check a specific directory: `./quota_check.sh /path/to/directory`.

## Output

The script iterates through each top-level directory in the specified directory or the default directory. For each directory, it displays the directory name, the count of files found within it (including files in subdirectories), and the total size of those files. Additionally, it provides a summary of the total file count and total file size for the entire directory.

Example output:

```
Directory: dir1
File count: 10
File size: 2.3 GB

Directory: dir2
File count: 5
File size: 0.8 GB

Summary for /scratch/snx3000/mjaehn
Total files: 15
Total file size: 3.1 GB
Percentage: 2%
```

## Contributing

Pull requests are welcome! If you have any suggestions, improvements, or bug fixes, please feel free to contribute.

## License

This script is released under the [MIT License](LICENSE).
