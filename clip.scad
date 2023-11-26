
// a simple clit that is essentially a cube with aslit in it
// it gets fixed on a paper shade preventing it from slipping out from its place

gap = 0.1;
width = 2;
epsilon = 0.01;
side = 10;

difference() {
    cube([width, side, side]);
    translate([(width-gap)/2, -2*epsilon, -2*epsilon])
        cube([gap, side-width+2*epsilon, side + 3*epsilon]);
}
