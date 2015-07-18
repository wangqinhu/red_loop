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

my $seq = "Sex8d.flank30.fa";
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
	$str = `echo $seq{$seq_id} | RNAfold --noPS`;
	if ($str =~ /\(\.+\)\S*\s+\(\s*(\S+)\)/) {
		$mfe = $1;
		if ($str =~ /\S+\n[\.\(\)]{30}\.[\.\(\)]{30}\s+\(\s*\S+\)/) {
			print "$seq_id\tLoop\t$mfe\n";
		} else {
			print "$seq_id\tStem\t$mfe\n";
		}
	} else {
		print "$seq_id\tNoSL\t-\n";
	}
}