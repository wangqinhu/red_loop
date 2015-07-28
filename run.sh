#!/bin/bash

# make output directory
if [ ! -d "output" ]; then
	mkdir output
fi

# judge RNA secondary structure
perl ./structure_bias.pl $1 30 > output/$2.str.txt

# statistics
echo -n "hairpin_loop:" >> output/$2.stats.txt
grep "h" output/$2.str.txt | wc -l >> output/$2.stats.txt
echo -n "interior_loop:" >> output/$2.stats.txt
grep "i" output/$2.str.txt | wc -l >> output/$2.stats.txt
echo -n "multi_loop:" >> output/$2.stats.txt
grep "m" output/$2.str.txt | wc -l >> output/$2.stats.txt
echo -n "stem:" >> output/$2.stats.txt
grep "s" output/$2.str.txt | wc -l >> output/$2.stats.txt
echo -n "free:" >> output/$2.stats.txt
grep -E "f|t" output/$2.str.txt | wc -l >> output/$2.stats.txt
