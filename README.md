## Bug Bounty Script

Bug Bounty Script is a powerful and versatile Bash script designed to automate security testing tasks for bug bounty hunting. This script streamlines the process of reconnaissance, port scanning, vulnerability scanning, and more, helping security researchers and bug bounty hunters efficiently identify potential security vulnerabilities in target domains.


## Prerequisites

Before running the script, ensure that you have the following tools installed on your system:

- Nmap
- Dirb
- DNSenum
- Whois
- WhatWeb
- Wappalyzer
- Nikto
- Sublist3r
- Xsser
- SQLMap
- Nuclei
- Amass

Refer to the respective tool documentation for installation instructions.


## Features

- Automates various security testing tasks, including DNS enumeration, whois lookup, HTTP fingerprinting, and technology stack detection.
- Performs comprehensive port scanning using Nmap to identify open ports and gather information about the target system.
- Conducts thorough web server scanning with Nikto, uncovering potential vulnerabilities in the target's web applications.
- Scans for subdomains using Sublist3r, enabling the discovery of additional attack vectors.
- Performs directory enumeration with Dirb to identify hidden directories and files on the target's web server.
- Checks for XSS vulnerabilities using Xsser, a powerful cross-site scripting (XSS) scanner.
- Detects SQL injection vulnerabilities using SQLMap, a popular tool for automated SQL injection detection and exploitation.
- Conducts vulnerability scanning with Nuclei, a highly extensible and fast scanner for detecting potential vulnerabilities.
- Performs automated reconnaissance with Amass, a versatile and comprehensive tool for discovering subdomains, domain names, and associated IP addresses.

## Options

    -h or --help: Display the usage instructions.
    -l <file> or --list <file>: Specify a file containing target domain(s) to scan.
    -d <domain> or --domain <domain>: Specify a single target domain to scan.
    -o <directory> or --output <directory>: Specify the output directory path.
    -nt <threads> or --nmap-threads <threads>: Specify the number of threads for Nmap (default: 100).
    -dt <threads> or --dirb-threads <threads>: Specify the number of threads for Dirb (default: 10).

## Usage

1. Clone the repository:

   ```shell
   git clone https://github.com/your-username/bug-bounty-script.git
   
   ```
   ```
   cd bug-bounty-script
    ```
    ```
   chmod +x bug_bounty_script.sh
    ```
   
    
    To scan multiple target domains listed in a file:
    ```
   ./bug_bounty_script.sh -l domains.txt
   ```
   To scan a single target domain and specify the output directory:
   ```
   ./bug_bounty_script.sh -d example.com -o output_directory
   ```
   To scan a single target domain and specify the output directory:
   ```
   ./bug_bounty_script.sh -d example.com -o output_directory

 
  To adjust the number of threads for Nmap and Dirb:
  ```
   ./bug_bounty_script.sh -nt 50 -dt 5
 ```
   

## Contribution

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## Maintainers :

`This Repo is maintained by : `

- [Shubham Rooter](https://github.com/shubham-rooter)

### Author :

**Shubham Rooter**

* [Github](https://www.github.com/shubham-rooter)
* [Twitter](https://www.twitter.com/shubhamtiwari_r)
* [Instagram](https://www.instagram.com/shubham_rooter)
* [Linkdin](https://www.linkedin.com/in/shubham-tiwari09/)  

### License :

Copyright © 2023, [Shubham Rooter](https://github.com/Shubham-Rooter).
Released under the [MIT License](LICENSE).

***Thankyou.***
***Happy Hunting..***
