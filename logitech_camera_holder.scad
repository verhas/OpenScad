use <arm.scad>;

W = 45;
L = 45;
d = 15;
$fn = 100;

translate([40, - 0, 4.5])
    difference() {
        union() {
            cube([L + 2 * d, W + d, 9], center = true);
            translate([- 40, 4.5, - 4.5])
                rotate([0, - 90, 180])
                    arm();
        }
        translate([- W / 2 + 5, 0, 0])
            cube([d, W, 11], center = true);
    }
