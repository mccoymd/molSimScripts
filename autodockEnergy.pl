#!/bin/usr/env perl
use warnings;
use strict;
use FileHandle;
use Data::Dumper;

my ($vinaOut) = @ARGV;
my $cleanName = substr($vinaOut,0,index($vinaOut,"."));
my @nameInfo = split(/_/,$cleanName);
my $OUTFILE = FileHandle->new("$vinaOut") or die("$!:$$vinaOut");
my $ERGFILE = FileHandle->new(">$cleanName.energy");
my $startOutput = 0;
foreach my $line (<$OUTFILE>){
    if ($line =~ m/^---/){
	$startOutput = 1;
    }elsif ($startOutput == 1 && $line !~ m/W/){
	$line =~ s/ +/\t/g;
	$line =~ s/\t//;
	print $ERGFILE join("\t",@nameInfo,$line);
    }
}
