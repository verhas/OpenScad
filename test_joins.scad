include <joiner.scad>

h = 20;
depth = 5;
epsilon = 0.1;

translate([0, 15, 0])
    difference() {
        translate([- h / 2, + epsilon, epsilon])
            cube([h - 2 * epsilon, 12, h - 2 * epsilon]);
        joiner(2, 6, depth, h, 1.6);
    }

translate([- h / 2, - 5 + epsilon, 0])
    cube([h, 5, h]);
joiner(1, 5, depth, h, 1.6);
