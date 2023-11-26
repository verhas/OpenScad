$fn = 500;
width = 61;
height = 15;
depth = 20;
half = height / 2;
sideWidth = 10;
sideLength = 15;

cube([width, depth, height / 2]);
translate([0, half, half])
    rotate([0, 90, 0])
        cylinder(width, half, half);
translate([0, half, half])
    cube([width, depth - half, half]);
translate([0, depth, 0])
    cube([sideWidth, sideLength, height]);
translate([width - sideWidth, depth, 0])
    cube([sideWidth, sideLength, height]);

