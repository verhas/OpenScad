d = 0.1;

X = 110;  // the width of the holder
x1 = 50; // the width of the hole for the camera and the wiring
dX = (X - x1) / 2;
z1 = 20;  // the height of the material under the
z2 = 20;  // the height of the hole for the camera and the wiring
z3 = 20;  // the width of the furniture, it is standard size, 20mm
z4 = 20;  // the height of the material above the furniture
Y = 150;  // the depth of the holder
y1 = 100; // the depth of the hole for the camera and the wiring
y2 = 10;  // the thickness of the front wall
y3 = 50;  // the dept of the top
difference() {
    cube([X, Y, z1 + z2 + z3 + z4]);
    //
    translate([dX, - d, z1])
        cube([x1, y1 + d, z2]);
    translate([- d, y2, z1])
        cube([X + 2 * d, y1 - y2, z2 + d]);
    translate([- d, 10, z1 + z2])
        cube([X + 2 * d, Y - y2 + d, z3]);
}
translate([0, y2, 0])
    cube([y2, z2, z1 + z2]);

r = 20;
p = 3;
translate([X / 2, y1 + (Y - y1) / 2, z1 + z2 + p - r])
    difference() {
        sphere(r, $fn = 100);
        translate([0, 0, - r])
            cube([2 * r, 2 * r, 2 * r], center = true);
    }
