#!/bin/usr/env perl
use warnings;
use strict;
use FileHandle;
use Data::Dumper;

my @ligList = ("1a","2a","bms8","bms202","bms1001","bms1166");
#my @ligList = ("1a");

#list for pdb structures
#my @scafList = ("4z18","4zqk","5niu","5nix","5n2d","5n2f","5j89","5j8o");
#test list
#my @scafList = ("4z18");
#traj sampling structures
my @scafList = ("md1","md2","md3");


foreach my $lig (@ligList){
    my $PDBOUT = FileHandle->new(">$lig.allMD.REF1.pdb") or die("$!:$lig.allMD.REF1.pdb");
    my $pose = 1;
#    my $refName = "$lig"."_"."ref1.pdb";
#    my $REFFILE = FileHandle->new("$refName") or die("$!:$refName");
#    print $PDBOUT "MODEL $pose\n";
#    foreach my $line (<$REFFILE>){
#	if ($line =~ m/^ATOM/){
#	    $line = substr($line,6);
#	    print $PDBOUT "HETATM".$line;
#	}
#    }
#    print $PDBOUT "ENDMLD\n";
    foreach my $scaf (@scafList){
	my $fname = "$scaf" . "_" . "$lig.out";
	my $OUTFILE = FileHandle->new("$fname") or die("$!:$fname");
	foreach my $line (<$OUTFILE>){
	    if ($line =~ m/^MODEL/){
		$pose++;
		print $PDBOUT "MODEL $pose\n";
	    }
	    if ($line =~ m/^HETATM/){
		print $PDBOUT $line;
	    }
	    if ($line =~ m/^ENDMDL/){
		print $PDBOUT $line;
	    }
	}
    }
}

=comment
foreach my $lig (@ligList){
    my $PDBOUT = FileHandle->new(">$lig.all.REF2.pdb") or die("$!:$lig.all.REF2.pdb");
    my $pose = 1;
    my $refName = "$lig"."_"."ref2.pdb";
    my $REFFILE = FileHandle->new("$refName") or die("$!:$refName");
    print $PDBOUT "MODEL $pose\n";
    foreach my $line (<$REFFILE>){
	if ($line =~ m/^ATOM/){
	    print $PDBOUT $line;
	}
    }
    print $PDBOUT "ENDMLD\n";
    foreach my $scaf (@scafList){
	my $fname = "$scaf" . "_" . "$lig.out";
	my $OUTFILE = FileHandle->new("$fname") or die("$!:$fname");
	foreach my $line (<$OUTFILE>){
	    if ($line =~ m/^MODEL/){
		$pose++;
		print $PDBOUT "MODEL $pose\n";
	    }
	    if ($line =~ m/^HETATM/){
		print $PDBOUT $line;
	    }
	    if ($line =~ m/^ENDMDL/){
		print $PDBOUT $line;
	    }
	}
    }
}

