#/usr/env perl;
use warnings;
use strict;
use FileHandle;

my ($boundaryFile) = @ARGV;
my $BOUNDARY = FileHandle->new("$boundaryFile") or die("$!:$boundaryFile");

my $center = <$BOUNDARY>;
$center =~ s/\R//;
my ($centerX,$centerY,$centerZ) = split(" ",$center);

my $minmax = <$BOUNDARY>;
$minmax =~ s/\R//;
$minmax =~ s/\{//g;
$minmax =~ s/\}//g;
my ($x1,$y1,$z1,$x2,$y2,$z2) = split(" ",$minmax);
my $xdim = $x2-$x1;
my $ydim = $y2-$y1;
my $zdim = $z2-$z1;

my $CONFIG = FileHandle->new(">boundary.config") or die("$!:boundary.config");

print $CONFIG "# Periodoc Boundary Conditions\n";
printf $CONFIG "cellBasisVector1 %.2f 0.0 0.0\n",$xdim;
printf $CONFIG "cellBasisVector2 0.0 %.2f 0.0\n",$ydim;
printf $CONFIG "cellBasisVector3 0.0 0.0 %.2f\n",$zdim;
printf $CONFIG "cellOrigin %.2f %.2f %.2f\n\n",$centerX,$centerY,$centerZ; 
print $CONFIG "wrapAll on\n";
