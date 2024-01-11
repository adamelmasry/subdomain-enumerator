# subdomain-enumerator README

## Overview
This script automates the process of subdomain enumeration using the Amass tool. It features DNS rotation for effective querying and outputs the results to a text file. This tool is ideal for cyber security professionals and network administrators who require an automated solution for the enumeration of multiple domains.

## Prerequisites
Before using this script, you must have Amass installed on your system. Amass is an open-source domain enumeration tool that aggregates data from various sources to discover subdomains. For installation instructions, visit the [Amass GitHub repository](https://github.com/OWASP/Amass).

## Features
- **Automated Subdomain Enumeration**: Leverages Amass for comprehensive subdomain discovery.
- **DNS Resolver Rotation**: Uses a list of public DNS resolvers and rotates them to prevent rate-limiting issues.
- **Output to Text File**: Saves the enumerated subdomains to a `.txt` file, making it easy to view and analyze the results.
- **Customisable Parameters**: Users can easily modify the script to set their domain list, output file path, and DNS resolvers.

## Usage
1. **Configure the Script**: 
   - Edit the `DOMAIN_LIST` variable to point to your list of domains.
   - Set the `OUTPUT_FILE` variable to the desired output file path.
   - Optionally, modify the list of `DNS_RESOLVERS` as per your requirements.
2. **Run the Script**: 
   - Execute the script in your terminal.
   - The script will loop through each domain in your list, using Amass and rotating DNS resolvers.

## Customisation
- **Domain List**: Place your domains in a `.txt` file, each domain on a new line.
- **Output Path**: Choose a path where you want the script to save the output file.
- **DNS Resolvers**: You can add or remove DNS resolvers from the provided list.

## Note
- Ensure that Amass is correctly installed and accessible in your system's PATH.
- Adjust the timeout and sleep durations in the script based on your network's capabilities and requirements.
