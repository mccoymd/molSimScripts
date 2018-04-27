#!/usr/env/bin perl
use warnings;
use strict;
use FileHandle;
use Data::Dumper;

my ($configName, $simLength, $baseFile1, $baseFile2, $boundaryFile, $pdbFile, $psfFile, @parameterFiles) = @ARGV;
my $simName = $simLength/50000;

my $CONFIG = FileHandle->new(">$configName.namd") or die("$!:$configName.namd");


print $CONFIG "structure          $psfFile\n";
print $CONFIG "coordinates        $pdbFile\n";
print $CONFIG "set outputname     $configName",".output\n\n";
print $CONFIG "paraTypeCharmm    on\n";
foreach my $parameter (@parameterFiles){
    print $CONFIG "parameters $parameter\n";
}
print $CONFIG "mergeCrossterms yes\n\n";

#my $baseFile = "./configSetup/configBASE.txt";
my $BASE1 = FileHandle->new("$baseFile1") or die("$!:$baseFile1");
foreach my $line (<$BASE1>){
    print $CONFIG $line;
}

print $CONFIG "\n";

my $BOUNDARY = FileHandle->new("$boundaryFile") or die("$!:$boundaryFile");

foreach my $line (<$BOUNDARY>){
    print $CONFIG $line;
}

print $CONFIG "\n";

my $BASE2 = FileHandle->new("$baseFile2") or die("$!:$baseFile2");
foreach my $line (<$BASE2>){
    print $CONFIG $line;
}

print $CONFIG "\n";

print $CONFIG "run $simLength;\n";

#print join("\n",$simLength, $boundaryFile, $pdbFile, $psfFile);
#print Dumper(@parameterFiles);
