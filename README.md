# Multithreaded Nuclei Scanner

This script allows you to perform a batch of security scans using the [Nuclei](https://nuclei.projectdiscovery.io/) tool in a multithreaded and concurrent manner, which can significantly reduce the overall scan time for a large number of URLs.

## Prerequisites

To use this script, you need to have the following software installed on your system:

- [Bash](https://www.gnu.org/software/bash/)
- [Nuclei](https://nuclei.projectdiscovery.io/)

## Usage

To use this script, you need to provide an input file that contains a list of URLs to scan, one URL per line. You can use any text editor to create the input file, or you can download a list of URLs from a web application using a tool like [OWASP ZAP](https://www.zaproxy.org/).

Once you have an input file, you can run the script using the following command:

```bash
./automated_nuclei_scan.sh input.txt
```


Replace `input.txt` with the path to your input file.

The script will run the `nuclei` scans concurrently using multiple threads, which can significantly reduce the overall scan time for a large number of URLs. By default, the script will use 4 concurrent scans, but you can adjust this value by editing the `concurrent_scans` variable in the script.

The output files will be saved in the `output` directory in the current working directory. The output file names will be based on the URLs, with the `http://` or `https://` prefix removed and any forward slashes replaced with underscores.

## License

This script is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as you see fit. However, please note that the script is provided as-is and without any warranty or liability.