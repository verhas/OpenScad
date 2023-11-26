use <arm.scad>;


armW = 9;
UnderLength = 100;
OverLength = 50;
TableThickness = 20;
MaterialThickness = armW ;
M = 12;
M2 = 6;
$fn = 100;
difference() {
    translate([- 35, - armW / 2, 2.5])
        rotate([0, 90, 0])
            rotate([0, 0, 90])
                arm();
    translate([- UnderLength, - TableThickness / 2, MaterialThickness+2.5])
        cube([UnderLength, TableThickness, TableThickness]);
}
translate([- UnderLength /2 -MaterialThickness/2, 0, MaterialThickness / 2])
    cube([UnderLength, TableThickness, 5+MaterialThickness], center = true);

translate([- UnderLength, 0, - TableThickness / 2])
    cube([MaterialThickness, TableThickness, 2 * MaterialThickness + TableThickness], center = true);

translate([- UnderLength, - TableThickness / 2, - MaterialThickness - TableThickness])
    cube([OverLength, TableThickness, MaterialThickness]);

difference() {
    translate([- 15, 0, 4])
        sphere(10);
    translate([- UnderLength, - TableThickness / 2, MaterialThickness])
        cube([UnderLength, TableThickness, TableThickness]);
}


