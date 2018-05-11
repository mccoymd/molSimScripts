#/usr/env perl
use warnings;
use strict;
use FileHandle;

my ($psfFile,$dcdFile) = @ARGV;
my $TCL = FileHandle->new(">genResetPDB.tcl") or die("$!:genResetPDB.tcl");

print $TCL "mol new $dcdFile waitfor all\n";
print $TCL "mol addfile $psfFile\n";
print $TCL "set final [atomselect top protein frame last]\n";
print $TCL "\$final writepdb endStruct.pdb\n";
print $TCL "exit";
    
