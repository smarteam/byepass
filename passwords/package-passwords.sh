#!/bin/bash

echo '[*] Parsing /opt/JohnTheRipper/run/john.pot'
cut -f2 -d\: /opt/JohnTheRipper/run/john.pot > /tmp/j
echo '[*] Merging /opt/JohnTheRipper/run/john.pot with passwords-hailmary.txt'
sort -u /tmp/j passwords-hailmary.txt > /tmp/p
rm /tmp/j
mv /tmp/p passwords-hailmary.txt
echo '[*] Compressing passwords-hailmary.txt'
zip passwords-hailmary.txt.zip passwords-hailmary.txt
echo '[*] Splitting passwords-hailmary.txt.zip'
split -n 3 passwords-hailmary.txt.zip passwords-hailmary-
mv passwords-hailmary-aa passwords-hailmary-1.txt.zip
mv passwords-hailmary-ab passwords-hailmary-2.txt.zip
mv passwords-hailmary-ac passwords-hailmary-3.txt.zip
rm passwords-hailmary.txt.zip
echo '[*] Passwords have been packaged for GitHub'
ls -lah