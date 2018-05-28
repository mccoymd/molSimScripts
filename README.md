# molSimScripts

Scripts for creating input files and running NAMD simulations on cgc docker image

the initial pdb/psf files need to be tested before input into the pipeline to ensure topology/parameter files are appropriate

--------

Autodock results
feed log file into autodockEnergy.pl to create table of results
concatenate into master table for analysis

adjust names of struct and drugs
run pdbqt2pdbCONC_SCAFFOLD.pl 

run script in results folder (for now)
