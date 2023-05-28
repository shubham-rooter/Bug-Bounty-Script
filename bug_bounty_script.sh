#!/bin/bash

# Bug Bounty Script

# Configuration
target_urls=()
output_directory="<output_directory>"
nmap_threads=100
dirb_threads=10

# Colors for formatting
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Display banner
display_banner() {
    echo -e "${CYAN}"
echo -e "██████╗░██╗░░░██╗░██████╗░  ██████╗░░█████╗░██╗░░░██╗███╗░░██╗████████╗██╗░░░██╗"
echo -e "██╔══██╗██║░░░██║██╔════╝░  ██╔══██╗██╔══██╗██║░░░██║████╗░██║╚══██╔══╝╚██╗░██╔╝"
echo -e "██████╦╝██║░░░██║██║░░██╗░  ██████╦╝██║░░██║██║░░░██║██╔██╗██║░░░██║░░░░╚████╔╝░"
echo -e "██╔══██╗██║░░░██║██║░░╚██╗  ██╔══██╗██║░░██║██║░░░██║██║╚████║░░░██║░░░░░╚██╔╝░░"
echo -e "██████╦╝╚██████╔╝╚██████╔╝  ██████╦╝╚█████╔╝╚██████╔╝██║░╚███║░░░██║░░░░░░██║░░░"
echo -e "╚═════╝░░╚═════╝░░╚═════╝░  ╚═════╝░░╚════╝░░╚═════╝░╚═╝░░╚══╝░░░╚═╝░░░░░░╚═╝░░░"

    echo -e "${NC}"
}

# Function to display usage instructions
display_help() {
    echo -e "Bug Bounty Script By Shubham Tiwari"
    echo -e "Usage: ./bug_bounty_script.sh [OPTIONS]"
    echo -e "Options:"
    echo -e "  -h, --help\t\tDisplay usage instructions"
    echo -e "  -l, --list\t\tSpecify a file containing target domain(s)"
    echo -e "  -d, --domain\t\tSpecify a single target domain"
    echo -e "  -o, --output\t\tSpecify the output directory path"
    echo -e "  -nt, --nmap-threads\tSpecify the number of threads for Nmap (default: 100)"
    echo -e "  -dt, --dirb-threads\tSpecify the number of threads for Dirb (default: 10)"
    echo
    echo -e "Social Media:"
    echo -e "  Twitter:   https://twitter.com/shubhamtiwari_r"
    echo -e "  LinkedIn:  https://www.linkedin.com/in/shubham-tiwari09"
    echo -e "  GitHub:    https://github.com/shubham-rooter"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            display_help
            exit 0
            ;;
        -l|--list)
            if [[ -n "$2" ]]; then
                while IFS= read -r domain || [[ -n "$domain" ]]; do
                    target_urls+=("$domain")
                done < "$2"
                shift 2
            else
                echo -e "${RED}Error: File not specified.${NC}"
                exit 1
            fi
            ;;
        -d|--domain)
            if [[ -n "$2" ]]; then
                target_urls+=("$2")
                shift 2
            else
                echo -e "${RED}Error: Domain not specified.${NC}"
                exit 1
            fi
            ;;
        -o|--output)
            if [[ -n "$2" ]]; then
                output_directory="$2"
                shift 2
            else
                echo -e "${RED}Error: Output directory not specified.${NC}"
                exit 1
            fi
            ;;
        -nt|--nmap-threads)
            if [[ -n "$2" ]]; then
                nmap_threads="$2"
                shift 2
            else
                echo -e "${RED}Error: Number of threads for Nmap not specified.${NC}"
                exit 1
            fi
            ;;
        -dt|--dirb-threads)
            if [[ -n "$2" ]]; then
                dirb_threads="$2"
                shift 2
            else
                echo -e "${RED}Error: Number of threads for Dirb not specified.${NC}"
                exit 1
            fi
            ;;
        *)
            echo -e "${RED}Error: Invalid option: $1${NC}"
            exit 1
            ;;
    esac
done

# Display banner
display_banner

# Perform bug bounty scanning for each target URL
for target_url in "${target_urls[@]}"; do
     # Additional reconnaissance tools
    echo -e "${GREEN}Running additional reconnaissance tools${NC}"

    # Perform DNS enumeration with DNSenum
    echo -e "${GREEN}Performing DNS enumeration with DNSenum${NC}"
    dnsenum "$target_url"

    # Perform whois lookup with Whois
    echo -e "${GREEN}Performing whois lookup with Whois${NC}"
    whois "$target_url"

    # Perform HTTP fingerprinting with WhatWeb
    echo -e "${GREEN}Performing HTTP fingerprinting with WhatWeb${NC}"
    whatweb "$target_url"

    # Perform technology stack detection with Wappalyzer
    echo -e "${GREEN}Performing technology stack detection with Wappalyzer${NC}"
    wappalyzer "$target_url"

    echo -e "${GREEN}Scanning target: $target_url${NC}"
    nmap -p 80,443 -T4 -A -Pn --max-parallelism $nmap_threads $target_url

    echo -e "${GREEN}Checking for open ports${NC}"
    nmap -p- -T4 -Pn --max-parallelism $nmap_threads $target_url

    echo -e "${GREEN}Running Nikto web server scanner${NC}"
    nikto -h $target_url

    echo -e "${GREEN}Scanning for subdomains using Sublist3r${NC}"
    sublist3r -d $target_url -o "$output_directory/$target_url-subdomains.txt"

    echo -e "${GREEN}Performing directory enumeration with Dirb${NC}"
    dirb "http://$target_url" -r -o "$output_directory/$target_url-dirb.txt" -t $dirb_threads

    echo -e "${GREEN}Scanning for XSS vulnerabilities with Xsser${NC}"
    xsser -u $target_url

    echo -e "${GREEN}Checking for SQL injection with SQLMap${NC}"
    sqlmap -u $target_url --batch

    echo -e "${GREEN}Running Nuclei for vulnerability scanning${NC}"
    nuclei -l "$output_directory/$target_url-subdomains.txt" -t vulnerabilities/ -o "$output_directory/$target_url-nuclei.txt"

    echo -e "${GREEN}Performing automated reconnaissance with Amass${NC}"
    amass enum -d $target_url -o "$output_directory/$target_url-amass.txt"

    echo -e "${GREEN}Completed bug bounty scan for $target_url${NC}"
    echo
done
