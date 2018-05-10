#/usr/env perl
use strict;
use warnings;
use FileHandle;
use Data::Dumper;

#input file name must end in ".pdb"
my ($outputName,$inputFileName,@topologyFileNames) = @ARGV;

#my $inputFileBase = substr($inputFileName,0,index(".pdb",$inputFileName)-4);
#print Dumper($inputFileBase);

my $TCL = FileHandle->new(">genInputStructFiles.tcl");

print $TCL "package require psfgen\n";
foreach my $topFile (@topologyFileNames){
    print $TCL "topology $topFile\n";
}
print $TCL "pdbalias residue HIS HSE\n";
print $TCL "segment PDL1 {pdb $inputFileName}\n";
print $TCL "coordpdb $inputFileName PDL1\n";
print $TCL "guesscoord\n";
print $TCL "writepdb struct.pdb\n";
print $TCL "writepsf struct.psf\n";
print $TCL "package require solvate\n";
print $TCL "solvate struct.psf struct.pdb -t 10 -o struct.wb\n";
print $TCL "package require autoionize\n";
print $TCL "autoionize -psf struct.wb.psf -pdb struct.wb.pdb -neutralize -o $outputName\n";
print $TCL "quit\n";
		       
			

		     
