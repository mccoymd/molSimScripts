mol new PDL1/pdb/4zqk_PD1.pdb
set ref [atomselect top "resid 53 to 69 and backbone and chain A"]

mol new md1.allClust.pdb waitfor all
set domain [atomselect top "resid 19 to 131"]
set avePos [measure avpos $domain]
$domain set {x y z} $avePos
set target [atomselect top "resid 53 to 69 and backbone"]
set M [measure fit $target $ref]
$domain move $M
$domain writepdb md1.pdb

mol new md2.allClust.pdb waitfor all
set domain [atomselect top "resid 19 to 131"]
set avePos [measure avpos $domain]
$domain set {x y z} $avePos
set target [atomselect top "resid 53 to 69 and backbone"]
set M [measure fit $target $ref]
$domain move $M
$domain writepdb md2.pdb

mol new md3.allClust.pdb waitfor all
set domain [atomselect top "resid 19 to 131"]
set avePos [measure avpos $domain]
$domain set {x y z} $avePos
set target [atomselect top "resid 53 to 69 and backbone"]
set M [measure fit $target $ref]
$domain move $M
$domain writepdb md3.pdb


