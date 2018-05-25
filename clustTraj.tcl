mol new ../Documents/PDL1traj/_1_trajSample1.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_1_trajSample2.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_1_trajSample3.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_1_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_2_trajSample1.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_2_trajSample2.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_2_trajSample3.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_2_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_3_trajSample1.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_3_trajSample2.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_3_trajSample3.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_3_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_4_trajSample1.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_4_trajSample2.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_4_trajSample3.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_4_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_5_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_6_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_7_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_8_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/_9_trajSample4.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/trajSample1.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/trajSample2.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/trajSample3.traj.pdb waitfor all
mol addfile ../Documents/PDL1traj/trajSample4.traj.pdb waitfor all
set nf [molinfo top get numframes]
set refRes [atomselect top "backbone and resid 19 to 131" frame 0]
set refStruct [atomselect top all frame 0]
for {set i 0} {$i < $nf} {incr i} {
set curStruct [atomselect top all frame $i]
set curRes [atomselect top "backbone and resid 19 to 131" frame $i]
set M [measure fit $curRes $refRes]
$curStruct move $M
}
