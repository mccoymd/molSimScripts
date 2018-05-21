#/usr/env perl
use warnings;
use strict;
use FileHandle;
use Data::Dumper;

my (@fileList) = @ARGV;

my $TCL = FileHandle->new(">clustTraj.tcl") or die("@!:clustTraj.tcl");

my $currPDB = shift(@fileList);
print $TCL "mol new $currPDB -waitfor all\n";

foreach $currPDB (@fileList){
    print $TCL "mol addfile $currPDB -waitfor all\n";
}

print $TCL "set nf [molinfo top get numframes]\n";
print $TCL "for \{set i 0\} \{\$i < \$nf\} \{incr i\} \{\n";

print $TCL "\}\n";
#print Dumper(@fileList);
