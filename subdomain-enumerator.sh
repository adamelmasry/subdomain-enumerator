#!/bin/bash
# Path to the amass tool
# IMPORTANT: Replace "/usr/bin/amass" with the actual path to your amass installation.
AMASS_PATH="/usr/bin/amass"

# Path to the domain list
# IMPORTANT: Update this path to the location of your domains.txt file.
DOMAIN_LIST="/path/to/your/domains.txt"  # <-- Change this to your file path

# Output file for the aggregated results
# IMPORTANT: Specify the desired path and filename for the output.
OUTPUT_FILE="/path/to/your/output/all_subdomains.txt"  # <-- Change this to your file path

# List of public DNS resolvers
declare -a DNS_RESOLVERS=("8.8.8.8" "8.8.4.4" "1.1.1.1" "9.9.9.9" "208.67.222.222")
resolver_index=0

# Define a timeout period (e.g., 5 minutes)
TIMEOUT_PERIOD=5m

# Loop through each domain
while read -r domain; do
   # Get the current timestamp
   timestamp=$(date +"%Y-%m-%d %H:%M:%S")
   # Print out the DNS resolver currently in use with a timestamp
   echo "[$timestamp] Starting enumeration for domain $domain using DNS Resolver: ${DNS_RESOLVERS[$resolver_index]}"
   # Amass command with the resolver, with output appended to OUTPUT_FILE, wrapped with timeout
   if timeout $TIMEOUT_PERIOD $AMASS_PATH enum -d "$domain" -r ${DNS_RESOLVERS[$resolver_index]} >> $OUTPUT_FILE; then
       echo "[$(date +"%Y-%m-%d %H:%M:%S")] Successfully finished enumeration for $domain"
   else
       echo "[$(date +"%Y-%m-%d %H:%M:%S")] Timeout or error occurred for $domain"
   fi
   # Rotate to the next DNS resolver for the next domain
   resolver_index=$((($resolver_index + 1) % ${#DNS_RESOLVERS[@]}))
   # Sleep for 30 seconds to avoid rate-limiting (adjust as needed)
   sleep 30
done < "$DOMAIN_LIST"
