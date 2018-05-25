#/usr/env perl
use strict;
use warnings;
use FileHandle;
use Data::Dumper;

my ($pdbFiles,$clusterFile) = @ARGV;

my $PDB = FileHandle->new("$pdbFiles") or die("$!:$pdbFiles");
my $pdbHeader = <$PDB>;

my $currPDB = "";
my @indPDBs;
foreach my $line (<$PDB>){
    $currPDB = $currPDB.$line;
    if ($line =~ /END/){
	push(@indPDBs,$currPDB);
	$currPDB = "";
    }
}

my $CLUST = FileHandle->new("$clusterFile") or die("$!:$clusterFile");

my $clustGroups = <$CLUST>;
$clustGroups =~ s/\R//;
$clustGroups =~ s/\} \{/_/g;
$clustGroups =~ s/\}//g;
$clustGroups =~ s/\{//g;
my @clusters = split("_",$clustGroups);

my $numOutputClust = 3;
for(my $i = 1; $i <= $numOutputClust; $i++){
    my @clustFrames = split(" ",$clusters[$i-1]);
    my $outName = "md".$i.".allClust.pdb";
    my $PDBout = FileHandle->new(">$outName") or die("$!:$outName");
    print $PDBout $pdbHeader;
    foreach my $struct (@clustFrames){
	print $PDBout $indPDBs[$struct];
    }

}
#print Dumper @clusters;
