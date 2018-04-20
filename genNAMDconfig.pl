#!/usr/env/bin perl
use warnings;
use strict;
use FileHandle;
use Data::Dumper;

my ($simLength, $boundaryFile, $pdbFile, $psfFile, @parameterFiles) = @ARGV;
my $simName = $simLength/50000;

my $CONFIG = FileHandle->new(">config.namd") or die("$!:config.namd");


print $CONFIG "structure          $pdbFile\n";
print $CONFIG "coordinates        $psfFile\n";
print $CONFIG "set outputname     $simName","ns",".output\n\n";
print $CONFIG "paraTypeCharmm    on\n";
foreach my $parameter (@parameterFiles){
    print $CONFIG "parameters $parameter\n";
}
print $CONFIG "mergeCrossterms yes\n\n";

my $baseFile = "./configSetup/configBASE.txt";
my $BASE = FileHandle->new("$baseFile") or die("$!:$baseFile");

foreach my $line (<$BASE>){
    print $CONFIG $line;
}


my $BOUNDARY = FileHandle->new("$boundaryFile") or die("$!:$boundaryFile");

foreach my $line (<$BOUNDARY>){
    print $CONFIG $line;
}

print $CONFIG "run \n$simLength;\n";

#print join("\n",$simLength, $boundaryFile, $pdbFile, $psfFile);
#print Dumper(@parameterFiles);
