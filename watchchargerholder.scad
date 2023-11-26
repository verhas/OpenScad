$fn = 50;
// the width to raise hollow forms over the surface to avoid one layer
delta = 0.01;

// the width of the material at the side of the circle that surrounds the holder
edge = 0.2;

// charger dimensions, given, has to measure in cm
diagonalCharger = 2.87;
radiusCharger = diagonalCharger / 2.0;
heightCharger = 0.65;
trenchWidth = 0.3;
cableThickness = 0.28;
cableNeckDiameter = 0.4;
cableNeckLength = 0.95;

// cylinder in the holder
gap = 0.05; // gap around the charger cylinder
heightCylinder = heightCharger - delta;
radiusCylinder = radiusCharger + gap;

// holder height
holderHeight = 0.8;

// trench dimensions
trenchDepth = (holderHeight + cableThickness) / 2;
trenchLength = 2.0;
trenchOverlap = trenchWidth;


// holder dimensions
holderWidth = radiusCharger * 2 + 2 * edge;
holderLength = trenchLength * 2 - trenchOverlap + 2 * radiusCylinder + edge;

difference() {
    // the whole holder
    cube([holderLength, holderWidth, holderHeight]);
    // the cylinder the charger head gets into
    translate([trenchLength * 2 - trenchOverlap + radiusCylinder,
            holderWidth / 2,
                holderHeight - heightCylinder + delta])
        cylinder(heightCylinder, radiusCylinder, radiusCylinder);

    // the trench from the charger head to leav space for the neck
    translate([2 * trenchLength - trenchOverlap - cableNeckLength, (holderWidth - cableNeckDiameter - 2 * gap) / 2,
                holderHeight - trenchDepth + delta])
        cube([cableNeckLength + delta, cableNeckDiameter + gap * 2, trenchDepth]);

    // the trench from the charger head to the wiring middle
    translate([trenchLength - trenchOverlap, (holderWidth - trenchWidth) / 2, holderHeight - trenchDepth + delta])
        cube([trenchLength + delta, trenchWidth, trenchDepth]);

    // big cut off
    translate([- delta, (holderWidth - trenchWidth) / 2, - delta])
        cube([trenchLength + delta, trenchWidth / 2 + holderWidth / 2 + delta, trenchDepth]);

    translate([trenchLength - trenchWidth, (holderWidth - trenchWidth) / 2, - delta])
        cube([trenchWidth, holderWidth / 2 + trenchWidth / 2 + delta, holderHeight + 2 * delta]);
}
translate([0, holderWidth / 2 + trenchWidth / 2, cableThickness])
    cube([trenchLength - trenchOverlap, holderWidth / 2 - trenchWidth / 2, holderHeight - cableThickness]);

