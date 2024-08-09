#!/usr/bin/env bash
find ./ -type f -name "DT*" -exec sh -c 'for file ; do
    new_name=$(echo "$file" | sed "s/^\([^ ]*\) .* \(.*\) - \([^\.]*\)/\1_Informe-Gestion-\2_\3/")
    mv "$file" $new_name
done' sh {} +
