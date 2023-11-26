include <threads.scad>;


metric_thread(diameter=8, pitch=1.25, length=10, internal=false, square=false);
translate([7.5,0,0])metric_thread(diameter=6, pitch=1, length=10, internal=false, square=false);