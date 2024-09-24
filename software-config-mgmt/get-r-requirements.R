# Check if an output file path or directory is provided as a command-line argument
args <- commandArgs(trailingOnly = TRUE)

# Get the installed packages and their versions
installed_packages <- installed.packages()[, c("Package", "Version")]

# Get the R version being used
r_version <- R.version.string

# Extract just the R version number (e.g., "R version 4.3.2 (2024-09-23)" becomes "4.3.2")
r_version_number <- gsub("R version ([0-9.]+).*", "\\1", r_version)

# Generate the file name using the R version
file_name <- paste0("rversion-", r_version_number, ".txt")

# Determine the output file path
if (length(args) > 0) {
    output_path <- args[1]

    # Check if the provided argument is a directory or a file path
    if (file.info(output_path)$isdir) {
        # If it's a directory, append the generated file name
        output_file <- file.path(output_path, file_name)
    } else {
        # If it's a file path, use it directly
        output_file <- output_path
    }
} else {
    # If no argument is provided, save to the current working directory
    output_file <- file_name
}

# Write the R version to the file
cat("R Version:", r_version, "\n", file = output_file)

# Write the header for installed packages and their versions
cat("\nInstalled Packages and Versions:\n", file = output_file, append = TRUE)

# Manually write column headers for the package data
cat("Package\tVersion\n", file = output_file, append = TRUE)

# Append the installed packages and their versions (without column names)
write.table(installed_packages, file = output_file, append = TRUE, row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")

# Print confirmation message
cat("R version and package information has been exported to", output_file, "\n")
