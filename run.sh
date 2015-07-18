#!/bin/bash

perl ./structure_bias.pl $1 > stem-loop.txt
echo -n "Loop:" >> stats.txt
grep "Loop" stem-loop.txt | wc -l >> stats.txt
echo -n "Stem:" >> stats.txt
grep "Stem" stem-loop.txt | wc -l >> stats.txt
