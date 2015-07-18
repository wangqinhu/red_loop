#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: structure_bias.pl
#
#        USAGE: ./structure_bias.pl *.fa
#
#  DESCRIPTION: Secondary structure bias caculator
#
#       AUTHOR: Qinhu Wang (wangqinhu@nwafu.edu.cn)
# ORGANIZATION: Northwest A&F University
#      VERSION: 1.0
#      CREATED: 07/17/15 22:48:31
#
#===============================================================================

use strict;
use warnings;
use utf8;

my $seq = $ARGV[0];                       # sequences file
my $flank = $ARGV[1] || 30;               # flank length
my $seq_id = undef;
my @seq_id = ();
my %seq = ();

open (FASTA, "$seq") or die "Cannot open file $seq: $!\n";
while (<FASTA>) {
	chomp;
	if (/^>(\S+)/) {
		$seq_id = $1;
		push @seq_id, $seq_id;
	} else {
		s/\s/g/;
		$seq{$seq_id} .= $_; 
	}
}
close FASTA;

my $str = undef;
my $mfe = undef;
foreach my $seq_id (@seq_id) {
	# Predict RNA secondary structure
	$str = `echo $seq{$seq_id} | RNAfold --noPS`;
	# If a valid RNAfold out found
	if ($str =~ /\(\.+\)\S*\s+\(\s*(\S+)\)/) {
		# Capture MFE
		$mfe = $1;
		# If edit site locate on an unmatched region
		if ($str =~ /\S+\n([\.\(\)]{$flank})\.([\.\(\)]{$flank})\s+\(\s*\S+\)/) {
			# Caputre left and right parts respectively
			my $left = $1;
			my $right = $2;
			# Remove dots
			$left =~ s/\.//g;
			$right =~ s/\.//g;
			# If one of them is empty
			if (length($left) == 0 or length($right) == 0) {
				print "$seq_id\tfree\t$mfe\n";
			} else {
				# Extract the last and first matches
				my $l = substr($left, length($left) - 1, 1);
				my $r = substr($right, 1, 1);
				# Judge structure: loop/bulge/free
				if ($l eq "("  && $r eq "(")  {
					print "$seq_id\tbulge\t$mfe\n";
				} elsif ($l eq ")" && $r eq ")") {
					print "$seq_id\tbulge\t$mfe\n";
				} elsif ($l eq "(" && $r eq ")") {
					print "$seq_id\tloop\t$mfe\n";
				} elsif ($l eq ")" && $r eq "(") {
					print "$seq_id\tfree\t$mfe\n";
				} else {
					warn "Unknown RNA secondary structure found in $seq_id!\n";
				}
			}
		# If edit site locate on a matched region
		} else {
			print "$seq_id\tstem\t$mfe\n";
		}
	# If no stem-loop found
	} else {
		$str =~ /\s+\(\s*(\S+)\)/;
		$mfe = $1;
		print "$seq_id\tnosl\t$mfe\n";
	}
}
