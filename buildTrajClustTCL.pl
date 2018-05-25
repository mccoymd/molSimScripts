#/usr/env perl
use warnings;
use strict;
use FileHandle;
use Data::Dumper;

my (@fileList) = @ARGV;

my $TCL = FileHandle->new(">clustTraj.tcl") or die("@!:clustTraj.tcl");

my $currPDB = shift(@fileList);
print $TCL "mol new $currPDB waitfor all\n";

foreach $currPDB (@fileList){
    print $TCL "mol addfile $currPDB waitfor all\n";
}

print $TCL "set nf [molinfo top get numframes]\n";
print $TCL "set refRes [atomselect top \"backbone and resid 19 to 131\" frame 0]\n";
print $TCL "set refStruct [atomselect top all frame 0]\n";
print $TCL "for \{set i 0\} \{\$i < \$nf\} \{incr i\} \{\n";
print $TCL "set curStruct [atomselect top all frame \$i]\n";
print $TCL "set curRes [atomselect top \"backbone and resid 19 to 131\" frame \$i]\n";
print $TCL "set M [measure fit \$curRes \$refRes]\n";
print $TCL "\$curStruct move \$M\n";
print $TCL "\}\n";
print $TCL "set clustRes [atomselect top \"backbone and resid 19 20 54 56 66 68 115 116 117 121 122 123 124 125\"\n";

#print Dumper(@fileList);
