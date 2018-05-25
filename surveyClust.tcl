set output [open "clusterStats.txt" w]
set clustRes [atomselect top "backbone and resid 19 20 54 56 66 68 115 116 117 121 122 123 124 125"]

for {set i 60} {$i < 80} {incr i} {
    set thr [expr $i / 100.0]
    puts $output [puts $thr]
    puts $output [measure cluster $clustRes distfunc rmsd cutoff $thr]
}

close $output

   
