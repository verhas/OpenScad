// LetterBlock.scad - Basic usage of text() and linear_extrude()

// Module instantiation
i = 0;
size = 20;
LetterBlock("Verhás Péter",size,10);

// Module definition.
// size=30 defines an optional parameter with a default value.
module LetterBlock(letter, size=25, position = 0) {
    difference() {
        height = size / 2.41;
        translate([position,0,height / 2])
        cube([len(letter)*size,size,height], center=true);
        translate([position,0,size/6]) {
            // convexity is needed for correct preview
            // since characters can be highly concave
            linear_extrude(height=size, convexity=4)
                text(letter, 
                     size=size*22/30,
                     font="Bitstream Vera Sans",
                     halign="center",
                     valign="center");
        }
    }
}

echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
