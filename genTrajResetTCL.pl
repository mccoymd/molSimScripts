#/usr/env perl
use warnings;
use strict;
use FileHandle;

my ($outputName,$psfFile,$dcdFile) = @ARGV;
my $TCL = FileHandle->new(">genResetPDB.tcl") or die("$!:genResetPDB.tcl");

print $TCL "mol new $dcdFile waitfor all\n";
print $TCL "mol addfile $psfFile\n";
print $TCL "package require pbctools\n";
print $TCL "pbc wrap -center com -centersel \"protein\" -compound residue -all\n";
print $TCL "set final [atomselect top protein frame last]\n";
print $TCL "\$final writepdb endStruct.pdb\n";
print $TCL "animate write pdb \{$outputName.traj.pdb\} beg 0 end -1 sel \[atomselect top \"protein\"\]\n";
print $TCL "exit";
    
