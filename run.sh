#!/bin/bash

# make output directory
if [ ! -d "output" ]; then
	mkdir output
fi

# judge RNA secondary structure
perl ./structure_bias.pl $1 > output/$2.sl.txt

# statistics
echo -n "loop:" >> output/$2.stats.txt
grep "loop" output/$2.sl.txt | wc -l >> output/$2.stats.txt
echo -n "bulge:" >> output/$2.stats.txt
grep "bulge" output/$2.sl.txt | wc -l >> output/$2.stats.txt
echo -n "free:" >> output/$2.stats.txt
grep "free" output/$2.sl.txt | wc -l >> output/$2.stats.txt
echo -n "stem:" >> output/$2.stats.txt
grep "stem" output/$2.sl.txt | wc -l >> output/$2.stats.txt
echo -n "nosl:" >> output/$2.stats.txt
grep "nosl" output/$2.sl.txt | wc -l >> output/$2.stats.txt
