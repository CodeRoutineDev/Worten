#!/bin/bash

DB_FILE="en.sqlite3"

# Append DB file name to gitignore if necessary.

if [[ -z $(grep "$DB_FILE" .gitignore) ]]; then
    echo "Appending $DB_FILE to .gitignore..."
    echo "$DB_FILE" >>".gitignore"
fi

if [[ ! -f "$DB_FILE" ]]; then
    echo "Downloading $DB_FILE..."
    wget "https://download.wikdict.com/dictionaries/sqlite/2_2022-10/$DB_FILE"
fi

echo "Generating wordlist..."

./generate-wordlist.sh "$DB_FILE" "abcdefghijklmnopqrstuvwxyz" |
    tr '[:lower:]' '[:upper:]' > english.txt
