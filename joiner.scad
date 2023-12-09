/*
snippet DOC

= Joiner

A geometric shape that can be used as a positive on one piece and a negative on the other and these two parts can be joined together to form a new shape.
This can provide a removable connection between two pieces.

The actual structure looks like the following:

image::joiner-1.png[]

The base of the joiner is a paralellogramma.
The parallel sides of the paralellogramma are `neck` and `shoulder`.
The neck is the narrower (smaller value) and the shoulder is the wider (larger value).

The vertical size of the structure is `height`.

[source,scad]
----
{%@snip code%}
----

When using 3D printing there is a small epsilon value to be added to the structures.
This epsilon value makes the shape sink into the other shape and also make the negative counterpart a bit smaller.
If the eplison offset is the same for bot of the shapes then the two shapes will fit together perfectly.

No.translateThey will not due to the fact that the 3D printer is not perfect and the two shapes will not fit together perfectly.

The angle of the paralellogramma at the bottom is the same as at the top, thereore the two sides are parallel.

end snippet
*/

// snippet code
module joiner(neck, shoulder, depth, height, scale=1.2) {

    leftOut = [- neck / 2, 0];
    rightOut = [neck / 2, 0];
    leftIn = [- shoulder / 2, depth];
    rightIn = [shoulder / 2, depth];
    linear_extrude(height = height, scale = scale)
        polygon(points = [leftOut, rightOut, rightIn, leftIn]);
}
// end snippet
