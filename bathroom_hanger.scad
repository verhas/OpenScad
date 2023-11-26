// This is abathroom hanger that can be put on the 6mm glass wall.

difference() {
    union() {
        sphere(r = 18, $fn = 200);
        translate([0, 0, 30])
            sphere(r = 18, $fn = 200);
    }
    translate([-2, - 30, -5])
        rotate([0, 30, 0])
            cube([10, 40, 40]);
    translate([- 28, - 20, - 10])
        rotate([0, 30, 0])
            cube([6, 60, 55]);
    translate([- 35, 6, - 20])
        cube([70, 20, 70]);
    translate([- 35, - 26, - 20])
        cube([70, 20, 70]);
}