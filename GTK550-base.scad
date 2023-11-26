/**
* Bosch GTK550 router base plate.
*
* The base plate is 90mm x 90mm x 5mm. It has 4 holes for M4 screws, 72mm apart.
* The holes are 8mm in diameter for the screw heads, and 2mm deep.
*
* The center hole is 30mm in diameter and has a 2mm thick 35mm diameter lip.
* This is to accomodate the inlay bushing, which is 30mm in diameter, has a 5mm wide and 2mm thick ledge arond it.
* You place the bushing from under and fix it with the screw from above.
*
* The original plate is not symmetric to make place for the attachments.
* If you need the attachments, use the original plate.
* To have a symmetrical plate the router can be used to with dado templates without paying attention to the direction
* of the router. This way all sides have the same distance from the milling knife.
*/
$fn = 500;

// The size of the base plate
w = 90;
// The width of the lip around the center hole.
h1 = 2;
// the height of the base plate
h = 5;

// text height on the top
th = 0.2;

// used to make the holes longer so that they do not stop exactly at the surface and does not leave a 0mm layer that may confuse some rendering software.
// this is the amount the holes, when substracted from the main material are potrude to the outside.
epsilon = 0.01;

module corner(h, r) {
    difference() {
        translate([- r, - r, 0])
            cube([r * 2, r * 2, h]);
        union() {
            translate([r, r, h / 2 + epsilon])
                cylinder(r = r, h = h + 2 * epsilon, center = true);
            translate([- r, r, h / 2 + epsilon])
                cylinder(r = r, h = h + 2 * epsilon, center = true);
            translate([r, - r, h / 2 + epsilon])
                cylinder(r = r, h = h + 2 * epsilon, center = true);
            translate([- r, - r, h / 2 + epsilon])
                cylinder(r = r, h = h + 2 * epsilon, center = true);
        }
    }
}


module screw_hole(pos) {
    translate(pos) {
        translate([0, 0, h / 2 + epsilon / 2])
            cylinder(r = 5 / 2, h = h + 2 * epsilon, center = true);
        translate([0, 0, h1 / 2 - epsilon / 2])
            cylinder(r = 8 / 2, h = h1 + epsilon, center = true);
    }
}

module center_hole() {
    translate([0, 0, h / 2 + epsilon / 2])
        cylinder(r = 30 / 2, h = h + 2 * epsilon, center = true);
    translate([0, 0, h1 / 2 - epsilon / 2])
        cylinder(r = 35 / 2, h = h1 + epsilon, center = true);
}

module textc(s, pos, size = 5) {
    translate(pos)
        translate([0, 0, h])
            linear_extrude(height = th + epsilon, center = true, $fn = 100)
                text(s, size = size, font = "Arial:style=Bold", halign = "center", valign = "center");
}

x = 72 / 2;
y = 65;


difference() {
    translate([- w / 2, - w / 2, 0])
        cube([w, w, h]);
    center_hole();
    cylinder(r = 5 / 2, h = h + 2 * epsilon, center = true);
    screw_hole([x, x, 0]);
    screw_hole([- x, x, 0]);
    screw_hole([x, x - y, 0]);
    screw_hole([- x, x - y, 0]);
    translate([w / 2, w / 2, - epsilon])
        corner(h + 2 * epsilon, 5);
    translate([- w / 2, w / 2, - epsilon])
        corner(h + 2 * epsilon, 5);
    translate([w / 2, - w / 2, - epsilon])
        corner(h + 2 * epsilon, 5);
    translate([- w / 2, - w / 2, - epsilon])
        corner(h + 2 * epsilon, 5);
    textc("nur für GTK550 Bosch", [0, 20, 0]);
    textc("size 90x90x5mm", [30, 0, 0], size = 2);
    textc("center 30/35mm", [30, - 3, 0], size = 2);
    textc("3/ 2mm", [35, - 6, 0], size = 2);
    textc("https://github.com/verhas/OpenScad/blob/main/GTK550-base.scad", [0, - 37, 0], size = 2);
}





