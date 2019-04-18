#!/bin/bash
var="$1";
echo "$var";
grep -r "$var" ./ | awk -F: '{print $1}' | uniq -c
exit 0