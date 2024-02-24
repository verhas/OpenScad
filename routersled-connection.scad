/**
* A rectangular router template is created using four rails.
* The rails are industry standard 17mm wide rails.


        <--------------- 17 mm ---------------->

                      <-- 8 mm -->
        +------------              ------------+         ^
        |            |             |           |         |
        |     --------             --------    | ^       |
        |     |                            |   | |       | 11mm
        |     |                            |   | | 7mm   |
        |     -----------------------------    | v       |
        |                                      |         |
        +--------------------------------------+         v
               <--------------- 13 mm ---->
*
* The piece designed here connects two parts of the rail using two M8 nuts and bolts.
*
*/
$fn = 500;

w = 17; // width of the rail
h = 5; // the height of the connector
l = 40; // length of the connector
p = 7; // padding to the connector
k = 10; // heigth of the alignemnt place
exc = 0.7; // the excentricity of the bolt hole
D = 8.6; // diameter of the bolt

eps = 0.2; // clearance

difference() {
    union() {
        cube([w, w, h]);
        translate([0, w, 0])
            cube([w, l - w + p, h]);
        translate([w, 0, 0])
            cube([l - w + p, w, h]);
        translate([w, w, -k])
            cube([l - w + p, h, k + h]);
        translate([w, w, -k])
            cube([h, l - w + p, k + h]);
        translate([w, w, -k])
            cube([l - w + p, l - w + p, k+h]);
    }
    translate([w / 2 + exc, l - w / 2, -eps])
        cylinder(d = D, h = h + 2 * eps);
    translate([l - w / 2, w / 2 + exc, -eps])
        cylinder(d = D, h = h + 2 * eps);
}
