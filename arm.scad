// A flexible arm structure that can reach out to different distances and hold something at the end of the arm.
// The arm-joint haves one degree of freedom and fixed using M3 screws.

W = 9; // the width of the arm
L = 40; // the length of the arm
d = 0.1; // delta width to add to embrace the edges
$fn = 100;

// metric M3 bolt, sizes are from https://www.engineersedge.com/hardware/standard_metric_hex_nuts_13728.htm
M = 3; // the size of the bolt
dm = 0.5; // the delta size of the bolthole
Smin = 6.5; // nut S size min
Smax = 6.5;  // nut S size max
Mmax = 2.55;

K = Mmax + 0.7; // width of the wall
Se = W ; //length of the wall hanging out
Si = L - W / 2; // length of the wall inside

module wall(z = 6) {
    difference() {
        union() {
            translate([0, 0, - Se])
                cube([K, W, Se]);
            translate([0, W / 2, - Se])
                rotate([0, 90, 0])
                    cylinder(K, W / 2, W / 2);
        }
        union() {
            // the bolt hole at the bottom
            translate([- d, W / 2, - W / 2])
                rotate([0, 90, 0])
                    cylinder(K + 2 * d, d = M + dm);
            translate([K - Mmax - d, W / 2, - W / 2])
                rotate([0, 90, 0])
                    cylinder(Mmax + 2 * d, d1 = Smin, d2 = Smax, $fn = z);
        }
    }
    polyhedron(
    points = [[0, 0, 0], [0, W, 0], [+ K, 0, 0], [+ K, W, 0], [0, 0, Si], [0, W, Si]],
    faces = [[0, 2, 3, 1], [0, 4, 2], [1, 3, 5], [0, 1, 5, 4], [4, 5, 3, 2]], convexity = 10
    );
}
module arm(EXT = 0) {
    L = L + EXT;
    difference() {

        union() {
            difference() {
                union() {
                    cube([W, W, L]);
                    translate([0, W / 2, L])
                        rotate([0, 90, 0])
                            cylinder(W, W / 2, W / 2);
                }

                difference() {
                    translate([- d, 0, L])
                        cube([W + 2 * d, W, W / 2]);
                    translate([W / 2, W + d, L])
                        rotate([90, 90, 0])
                            cylinder(W + 2 * d, W / 2, W / 2);
                }
            }

            // the wall on one side
            rotate([0, 0, - 90,])
                wall();

            // the wall on the other side
            translate([W, W, 0])
                rotate([0, 0, 90,])
                    wall(z = 100);
        }

        // the bolt holes at the top
        translate([W / 2, - K - d, L])
            rotate([0, 90, 90])
                cylinder(W + 2 * K + 2 * d, d1 = M + dm, d2 = M + dm);

        translate([- d, W / 2 - d, L])
            rotate([0, 90, 0])
                cylinder(W + 2 * K + 2 * d, d1 = M + dm, d2 = M + dm);
    }
}

arm(10);