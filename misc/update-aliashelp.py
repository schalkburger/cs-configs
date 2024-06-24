# python update-aliashelp.py ..\cs2\configs\aliases.cfg ..\cs2\configs\aliashelp.cfg

import os
import sys
import re


def convert_line(line):
    line = line.strip()
    match = re.match(r'alias\s+"([^"]+)"\s+"([^"]+)"', line)
    if match:
        alias_name = match.group(1)
        command = match.group(2)
        return f'echoln "alias {alias_name} {command}"'
    else:
        return f'echoln "{line}"'


def convert_file(input_file, output_file):
    if not os.path.isfile(input_file):
        print(f"Error: The file '{input_file}' does not exist.")
        sys.exit(1)

    with open(input_file, "r") as infile, open(output_file, "w") as outfile:
        for line in infile:
            converted_line = convert_line(line)
            outfile.write(f"{converted_line}\n")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python update-aliashelp.py <input_file> <output_file>")
    else:
        input_file = sys.argv[1]
        output_file = sys.argv[2]
        convert_file(input_file, output_file)
