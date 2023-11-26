// simple shelf to hold the bit screwdrivers
// the selves will be attached to a larger IKEA shelf systemwith screws from below
// the surroundig boxes for the two sets are:
// (depth, depth stop, height, width)
// 220, 190, 100, 200 (mm)
// 220, 170, 70, 140 (mm)

material_width = 7; // mm
shelf_depth = 220;
shelf1_depth_stop = 190;


shelf2_depth_stop = 170;


rail_depth = 25;
ear_length = 25;

epsilon = 0.1;

module ear() {
    difference() {
        translate([0, 0, material_width / 2])
            cube([ear_length, ear_length, material_width], center = true);
        translate([0, 0, - epsilon])
            cylinder(d = 5, h = material_width + 2 * epsilon, $fn = 100);
        translate([0, 0, - epsilon])
            cylinder(d1 = 10, d2 = 5, h = 3, $fn = 100);
    }
}
rail(100, 140);
module rail(width, height) {
    difference() {
        union() {
            // the bottom rail
            cube([width + 2 * material_width, material_width, rail_depth]);

            // the sides of the rail
            cube([material_width, height + material_width, rail_depth]);
            translate([width + material_width, 0, 0])
                cube([material_width, height + material_width, rail_depth]);

            // the top rail
            translate([0, height, 0])
                cube([width + 2 * material_width, material_width, rail_depth]);

            // the ears to hold the rail in place with screws
            translate([ear_length / 2, height, ear_length / 2 + rail_depth - epsilon])
                rotate([- 90, 0, 0])
                    ear();
            translate([width + 2* material_width - ear_length / 2, height, ear_length / 2 + rail_depth - epsilon])
                rotate([- 90, 0,])
                    ear();
        }
        translate([material_width * 2, material_width / 2 + epsilon, - epsilon])
            cube([rail_depth + epsilon, material_width / 2 + epsilon, rail_depth + 2 * epsilon]);
        translate([width - rail_depth, material_width / 2 + epsilon, - epsilon])
            cube([rail_depth + epsilon, material_width / 2 + epsilon, rail_depth + 2 * epsilon]);
        translate([width / 2 - rail_depth / 2 + material_width, material_width / 2 + epsilon, - epsilon])
            cube([rail_depth + epsilon, material_width / 2 + epsilon, rail_depth + 2 * epsilon]);
    }
}

module bottom() {
    difference() {
        cube([shelf_depth, rail_depth, material_width]);
        translate([- epsilon, - epsilon, - epsilon])
            cube([rail_depth + epsilon, rail_depth + 2 * epsilon, material_width / 2 + epsilon]);
        translate([shelf_depth - rail_depth + epsilon, - epsilon, - epsilon])
            cube([rail_depth + epsilon, rail_depth + 2 * epsilon, material_width / 2 + epsilon]);
    }
}

