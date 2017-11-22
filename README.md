About
-----
These scripts are used in the analysis of RNA secondary structure bias for the real edited A sites and random A sites in _Fusarium graminearum_, which firstly conducted in our RNA editing paper[1].

```
.
|-- README.md                            # This file
|-- data                                 # Data directory
|   |-- 3-30.txt                         # Edited A sites (upstream 30 nt + A + downstream 30 nt) in F. graminearum [editing level: 3-30%]
|   |-- 30-60.txt                        # Edited A sites (upstream 30 nt + A + downstream 30 nt) in F. graminearum [editing level: 30-60%]
|   |-- 60-100.txt                       # Edited A sites (upstream 30 nt + A + downstream 30 nt) in F. graminearum [editing level: 60-100%]
|   |-- Sex8d.flank30.fa                 # Edited A sites (upstream 30 nt + A + downstream 30 nt) in F. graminearum [editing level: 3-100%]
|   `-- fg.sample.1.fa                   # Random A sites (upstream 30 nt + A + downstream 30 nt) in F. graminearum
|-- dotbracket_to_element_string.py      # Python script which converts a dotbracket notation to an element-type notation, form forgi package
|-- mfe.R                                # R script used to generate MFE plot
|-- mfe.sh                               # Shell script used to extract MFE from the *.str.txt files
|-- mfe_hairpin_loop.R                   # R script used to generate MFE plot - hairpin
|-- mfe_hairpin_loop.sh                  # Shell script used to extract MFE from the *.str.txt files - hairpin
|-- output                               # Output directory
|   |-- bg.dat                           # Background (random A sites), MFE - all
|   |-- bg.h.dat                         # Background (random A sites), MFE - hairpin
|   |-- bg.stats.txt                     # Background (random A sites), secondary structure summary
|   |-- bg.str.txt                       # Background (random A sites), secondary structure - detail (structure and MFE)
|   |-- class.dat                        # Automatically generated RNA secondary structure classification file
|   |-- class.freq                       # Manually adjusted RNA secondary structure classification file
|   |-- ed.dat                           # Edited A sites, MFE - all [editing level: 3-100%]
|   |-- ed.h.dat                         # Edited A sites, MFE - hairpin [editing level: 3-100%]
|   |-- ed.stats.txt                     # Edited A sites, secondary structure summary [editing level: 3-100%]
|   |-- ed.str.txt                       # Edited A sites, secondary structure - detail (structure and MFE) [editing level: 3-100%]
|   |-- ed100.dat                        # Edited A sites, MFE - all [editing level: 60-100%]
|   |-- ed100.h.dat                      # Edited A sites, MFE - hairpin [editing level: 60-100%]
|   |-- ed100.stats.txt                  # Edited A sites, secondary structure summary [editing level: 60-100%]
|   |-- ed100.str.txt                    # Edited A sites, secondary structure - detail (structure and MFE) [editing level: 60-100%]
|   |-- ed30.dat                         # Edited A sites, MFE - all [editing level: 3-30%]
|   |-- ed30.h.dat                       # Edited A sites, MFE - hairpin [editing level: 3-30%]
|   |-- ed30.stats.txt                   # Edited A sites, secondary structure summary [editing level: 3-30%]
|   |-- ed30.str.txt                     # Edited A sites, secondary structure - detail (structure and MFE) [editing level: 3-30%]
|   |-- ed60.dat                         # Edited A sites, MFE - all [editing level: 30-60%]
|   |-- ed60.h.dat                       # Edited A sites, MFE - hairpin editing level: 30-60%]
|   |-- ed60.stats.txt                   # Edited A sites, secondary structure summary editing level: 30-60%]
|   |-- ed60.str.txt                     # Edited A sites, secondary structure - detail (structure and MFE) editing level: 30-60%]
|   |-- mfe.pdf                          # MFE plot
|   `-- stack.pdf                        # Stack plot
|-- run.sh                               # Shell script used to generate the secondary structure summary file
|-- stack.sh                             # Shell script used to generate the output/class.dat file
|-- stackstr.R                           # R script used to produce the stack plot
`-- structure_bias.pl                    # Perl script used to calculate the RNA secondary structure of the given sequences
```

For newly generated data, please run structure_bias.pl firstly and then use *.R for plots.

[1]: Liu H, Wang Q, He Y, Chen L, Hao C, Jiang C, Li Y, Dai Y, Kang Z, Xu JR. (2016) Genome-wide A-to-I RNA editing in fungi independent of ADAR enzymes. Genome Res 26, 449-509.