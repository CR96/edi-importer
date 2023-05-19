#!/bin/sh

# edi-importer
# Given a GTFS, generate textfiles compatible with the Eliot Deviation Index calculator.

# Usage:
# ./edi-importer [input GTFS archive] [output text file]
# Default output file is "edi_import.txt"
gtfs_archive="$1"
output="$2"

if [ -z $1 ]
    then
        echo "Please select a GTFS archive. Usage: ./edi-importer.sh INPUT_ARCHIVE OUTPUT_TEXT_FILE"
	exit
    fi

echo "Routes found in GTFS archive:"

unzip -p $1 routes.txt | cat

echo
read -p "Enter route to import (numerical entry only): " routevar

# Find every trip which corresponds to selected route
# Search for lines with route number between commas

unzip -p $1 trips.txt | grep ",$routevar,"
