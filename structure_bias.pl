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

my $fold = undef;
my $str = undef;
my $mfe = undef;
my $est = undef;
my $type = undef;
foreach my $seq_id (@seq_id) {
	# Predict RNA secondary structure
	$fold = `echo $seq{$seq_id} | RNAfold -T --noPS`;
	# If a valid RNAfold out found
	if ($fold =~ /\S+\n(\S+)\s+\(\s*(\S+)\)/) {
		$str = $1;
		$mfe = $2;
		$est = `echo "$str" | python dotbracket_to_element_string.py -`;
		$type = substr($est, $flank, 1);
		print "$seq_id\t$type\t$mfe\n";
	}
}
