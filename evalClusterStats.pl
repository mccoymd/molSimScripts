#/usr/env perl
use warnings;
use strict;
use FileHandle;
use Data::Dumper;

#my ($statsFile) = @ARGV;
my $statsFile = "clusterStats.txt";

#manual threshold for initial clustering
#my @thresholds = ("0.4","0.5","0.6","0.7","0.8","0.9");
#manual threshold for second clustering
my @thresholds = ("0.6","0.61","0.62","0.63","0.64","0.65","0.66","0.67","0.68","0.69","0.70","0.71","0.72","0.73","0.74","0.75","0.76","0.77","0.78","0.79");

my $STATS = FileHandle->new("$statsFile") or die("$!:$statsFile");

foreach my $line (<$STATS>){
    #hardcode line skip because didn't output threshold in output file
    if ($line =~ /\{/){
	#hardcode to output desired cluster
	if(@thresholds[0] == 0.67){
	    my $CLUST = FileHandle->new(">PDL1clust.txt") or die("$!:CANT OPEN WRITE FILE");
	    print $CLUST $line;
	}
	$line =~ s/\R//;
	$line =~ s/\} \{/_/g;
	$line =~ s/\}//g;
	$line =~ s/\{//g;
	my @clusters = split("_",$line);
	print shift(@thresholds),"\t";
	foreach my $clust (@clusters) {
	    my @clustStructs = split(" ",$clust);
	    print scalar(@clustStructs)/12500,"\t";
	}
	print "\n";
	
    }
}

