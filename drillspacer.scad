/*

= Intermediate piece between the schiene and teh chuck

*/
$fn = 100;
epsilon = 0.1;
drillX_Offset = 27 / 2;
drillZ_Offset = 20 / 2;
railX_Offset = 15 / 2;
railZ_Offset = 16 / 2;

drillBoltHeight = 8;
railBoltHeight = 10;

w = 40;

horizontal = [90, 0, 0];

difference() {
    cube([w, w, 35], center = true);
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
        boltRadius = 4.8 / 2;
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
        boltRadius = 3.2 / 2;
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