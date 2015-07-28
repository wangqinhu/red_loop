cd output
paste <(cut -d':' -f1,2 bg.stats.txt) <(cut -d':' -f2 ed.stats.txt) <(cut -d':' -f2 ed30.stats.txt) <(cut -d':' -f2 ed60.stats.txt) <(cut -d':' -f2 ed100.stats.txt) > class.dat
