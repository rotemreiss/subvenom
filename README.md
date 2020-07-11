# SubVenom
Enumerates subdomains using multiple tools for bigger scope enumeration.

## Prerequisites
Sublist3r, subfinder and assetfinder must be in your PATH.
Links for installing the tools:

- https://github.com/aboul3la/Sublist3r
- https://github.com/projectdiscovery/subfinder
- https://github.com/tomnomnom/assetfinder

## Installation
Just clone the repo

```bash
git clone https://github.com/rotemreiss/subvenom.git
```

## Usage
Single domain:

```bash
echo "domain.com" | ./subvenom.sh
```

Multiple domains (from file):

```bash
cat domains.txt | ./subvenom.sh
```

On both cases the results will be saved as `{domain}-domains.txt`

## Contribution
Feel free to add more scanners to this tool to make it even more robust!

## TODO
- Add some error handling
- Add some options