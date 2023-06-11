#!/bin/bash

# Set the target URL
url="https://example.com"

# Set the output file
output_file="recon_results.txt"

# Perform subdomain enumeration
echo "Performing subdomain enumeration..."
subdomains=$(subfinder -d $url)
subdomains+=$(sublist3r -d $url)
subdomains+=$(massdns -d $url)
echo $subdomains >> $output_file

# Perform directory and file discovery
echo "Performing directory and file discovery..."
dirsearch -u $url -e * >> $output_file

# Check for open ports and running services
echo "Performing port scan..."
nmap -sC -sV $url >> $output_file

# Check for known vulnerabilities
echo "Checking for known vulnerabilities..."
vulners -s $url >> $output_file

# Retrieve JavaScript files
echo "Retrieving JavaScript files..."
GetJS -u $url >> $output_file

# Find links
echo "Finding links..."
GoLinkFinder -u $url >> $output_file

# Get all URLs
echo "Retrieving all URLs..."
getallurls -u $url >> $output_file

# Check for URLs in Wayback Machine
echo "Checking for URLs in Wayback Machine..."
WayBackUrls -u $url >> $output_file

# Check for robots.txt in Wayback Machine
echo "Checking for robots.txt in Wayback Machine..."
WayBackRobots -u $url >> $output_file

# Check for Forced Browsing vulnerabilities
echo "Checking for Forced Browsing vulnerabilities..."
FFuF -u $url >> $output_file

# Check for XSS vulnerabilities
echo "Checking for XSS vulnerabilities..."
XSSHunter -u $url >> $output_file

# Check for SQL injection vulnerabilities
echo "Checking for SQL injection vulnerabilities..."
SQLMap -u $url >> $output_file

# Check for XXE vulnerabilities
echo "Checking for XXE vulnerabilities..."
XXEInjector -u $url >> $output_file

# Check for SSRF vulnerabilities
echo "Checking for SSRF vulnerabilities..."
SSRFDetector -u $url >> $output_file

# Check for secrets in Git repository
echo "Checking for secrets in Git repository..."
GitTools -u $url >> $output_file
gitallsecrets -u $url >> $output_file

# Check for race condition vulnerabilities
echo "Checking for race condition vulnerabilities..."
RaceTheWeb -u $url >> $output_file

# Check for CORS misconfigurations
echo "Checking for CORS misconfigurations..."
CORStest -u $url >> $output_file

# Take screenshots
echo "Taking screenshots..."
EyeWitness -u $url >> $output_file

# Check for parameter tampering vulnerabilities
echo "Checking for parameter tampering vulnerabilities..."
parameth -u $url >> $output_file

echo "Recon complete!" 
