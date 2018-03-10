#!/bin/bash
for filename in *.json; do
    echo $filename
    # use jq to get the name
    bot_name=$(cat $filename | jq '.name')
    # remove quotes
    bot_name=$(echo "$bot_name" | sed -e 's/^"//' -e 's/"$//')
    folder_name=$(echo "$bot_name" | sed 's/ /_/g')
    folder_name=$(echo "$folder_name" | awk '{print tolower($0)}')
    mkdir $folder_name
    mv $filename $folder_name
    echo "# $bot_name" >> $folder_name/README.md
    cp ~/info.json $folder_name
done
