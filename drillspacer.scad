/*

= Intermediate piece between the schiene and teh chuck

*/
$fn = 100;
epsilon = 0.01;
drillX_Offset = 27 / 2;
drillZ_Offset = 20 / 2;
railX_Offset = 15 / 2;
railZ_Offset = 16 / 2;

drillBoltHeight = 8;
railBoltHeight = 10;

w = 40;

// there should be a vertical offset between the center of the drill connection and the center of the rail connection
// otherwise the holes would overlap reducing the strength of the piece and also making it impossible to assemble
// if the pieces are centered the heads of the bolts would overlap and they cannot be placed into their final depth in
// the holes
offset = 4;

// The mimimum height is 35mm, but it needs to be so large that the holes get placed still inside the piece
// if you increase the offset you may also need to increase the 'h' height
//
// The 35mm height is whent he holes are not offseted and the heigth is so that the drill block is centered.translate
// 35mm is the height of the drill block
h = 35 + 2 * offset;

// the rotation that will make the holes horizontal
horizontal = [90, 0, 0];

difference() {
    cube([w, w, h], center = true);

    // the four holes for the drill block
    translate([0, 0, - offset])
        union() {
            union() {
                boltHeadRadius = 10 / 2;
                yOffset = - drillBoltHeight / 2 - epsilon;
                translate([- drillX_Offset, yOffset, drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - drillBoltHeight, r = boltHeadRadius, center = true);
                translate([drillX_Offset, yOffset, drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - drillBoltHeight, r = boltHeadRadius, center = true);
                translate([drillX_Offset, yOffset, - drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - drillBoltHeight, r = boltHeadRadius, center = true);
                translate([- drillX_Offset, yOffset, - drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - drillBoltHeight, r = boltHeadRadius, center = true);
            }

            union() {
                // the drill block uses M5 bolts
                // the hole for the bolt to run through has a delta tolerance to accomodate the PLA shrinking
                delta = 0.9;
                boltRadius = (5 + delta) / 2;
                yOffset = + epsilon;
                translate([- drillX_Offset, yOffset, drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
                translate([drillX_Offset, yOffset, drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
                translate([drillX_Offset, yOffset, - drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
                translate([- drillX_Offset, yOffset, - drillZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
            }
        }

    // the four holes for the rail
    translate([0, 0, offset])
        union() {
            union() {
                boltHeadRadius = 5.5 / 2;
                yOffset = + railBoltHeight / 2 + epsilon;
                translate([- railX_Offset, yOffset, railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - railBoltHeight, r = boltHeadRadius, center = true);
                translate([railX_Offset, yOffset, railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - railBoltHeight, r = boltHeadRadius, center = true);
                translate([railX_Offset, yOffset, - railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - railBoltHeight, r = boltHeadRadius, center = true);
                translate([- railX_Offset, yOffset, - railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w - railBoltHeight, r = boltHeadRadius, center = true);
            }

            union() {
                // the rail uses M3 bolts
                // the hole for the bolt to run through has a delta tolerance to accomodate the PLA shrinking
                delta = 0.9;
                boltRadius = (3 + delta) / 2;
                yOffset = - epsilon;
                translate([- railX_Offset, yOffset, railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
                translate([railX_Offset, yOffset, railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
                translate([railX_Offset, yOffset, - railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
                translate([- railX_Offset, yOffset, - railZ_Offset])
                    rotate(horizontal)
                        cylinder(h = w, r = boltRadius, center = true);
            }
        }
}