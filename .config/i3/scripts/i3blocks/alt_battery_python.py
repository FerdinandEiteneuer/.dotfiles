#!/bin/python

import subprocess
import sys


if __name__ == '__main__':
 
    proc = subprocess.Popen(["acpi", "-b"],
                            stderr=subprocess.PIPE,
                            stdout=subprocess.PIPE,
                            shell=True)

    acpi_output, err = proc.communicate()

    if err != b'':
        sys.exit(-1)

    infos = str(acpi_output).split(' ')

    for info in infos:
        if '%,' in info:
            percentage = info[:-2]  # remove %, from the end
            sys.exit(int(percentage))
    else:
        sys.exit(-1)
