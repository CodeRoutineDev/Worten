#!/bin/bash

DB_FILE="de.sqlite3"

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

# German Alphabet without Q, X and Y.
./generate-wordlist.sh "$DB_FILE" "abcdefghijklmnoprstuvwzöäüß" |
    sed -e "s/ö/oe/g" -e "s/ä/ae/g" -e "s/ü/ue/g" -e "s/ß/ss/g" |
    sort |
    uniq -u |
    tr '[:lower:]' '[:upper:]' > german.txt
