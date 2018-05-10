mol new ./structure/5jdr.pdb
set PDL1 [atomselect top "protein and chain B"]
$PDL1 writepdb ./structure/5jdr.clean.pdb
