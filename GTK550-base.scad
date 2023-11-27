/**
* Bosch GTK550 router base plate.
*
* The base plate is 90mm x 90mm x 5mm. It has 4 holes for M4 bolts, 72mm apart.
* The holes are 8mm in diameter for the bolt heads, and 2mm deep.
*
* The center hole is 30mm in diameter and has a 2mm thick 35mm diameter lip.
* This is to accomodate the inlay bushing, which is 30mm in diameter, has a 5mm wide and 2mm thick ledge arond it.
* You place the bushing from under and fix it with the bolt from above.
*
* The original plate is not symmetric to make place for the attachments.
* If you need the attachments, use the original plate.
* To have a symmetrical plate the router can be used to with dado templates without paying attention to the direction
* of the router. This way all sides have the same distance from the milling knife.
*/
$fn = 500;

// The size of the base plate
w = 90;
// The height of the lip around the center hole.
h1 = 2;
// the height of the base plate
h = 5;

// the height of the bolt head
sh = 3.5;

centerHoleTolerance = 0.5;
// Center hole small radius
cr = (30.0 + centerHoleTolerance) / 2;
// Center hole large radius
cR = (35.0 + 2) / 2;

plaShrinking = 2;

hhd = (72.0 + plaShrinking) / 2.0;
vhd = 65.0 + plaShrinking / 2.0;

// used to make the holes longer so that they do not stop exactly at the surface and does not leave a 0mm layer that may confuse some rendering software.
// this is the amount the holes, when substracted from the main material are potrude to the outside.
epsilon = 0.01;

module bolt_hole(pos) {
    translate([pos[0], pos[1], 0]) {
        translate([0, 0, h / 2 + epsilon / 2])
            cylinder(r = 5 / 2, h = h + 2 * epsilon, center = true);
        translate([0, 0, sh / 2 - epsilon / 2])
            cylinder(r = 8 / 2, h = sh + epsilon, center = true);
    }
}

module center_hole() {
    translate([0, 0, h / 2 + epsilon / 2])
        cylinder(r = cr, h = h + 2 * epsilon, center = true);
    translate([0, 0, h1 / 2 - epsilon / 2])
        cylinder(r = cR, h = h1 + epsilon, center = true);
}

difference() {
    translate([- w / 2, - w / 2, 0])
        cube([w, w, h]);
    center_hole();
    bolt_hole([hhd, hhd]);
    bolt_hole([- hhd, hhd]);
    bolt_hole([hhd, hhd - vhd]);
    bolt_hole([- hhd, hhd - vhd]);
}




