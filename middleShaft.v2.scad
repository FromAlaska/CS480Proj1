$fs=0.1;
boxLength = 10;
boxWidth = 90;

Hinge();

module Hinge() {
    union() {
        makesHoles();
        SquareBox(0,-10,0);
        SquareBox(0,boxWidth,0);
        
        hingePart(0,0,55);
        hingePart(0,0,40);

        hingePart(0,boxWidth-10,55);
        hingePart(0,boxWidth-10,40);
    }
}

module hingePart(cubeX,cubeY,cubeZ) {
    translate([cubeX,cubeY,cubeZ]) { 
            cube([10,10,5]);
        }
}

module SquareBox(xbox,ybox,zbox) {
    translate([xbox,ybox,zbox]) {
        cube([10,10,60]);
        
    }
}

module makesHoles() {
    union() {
        difference() {
            squareBox(boxLength,boxWidth);
            tube(5,boxWidth/2-25);
            tube(5,boxWidth/2+25);
        }
    }
}

module squareBox(length,width) {
    linear_extrude(height=10,convexity=8){
        square([length,width]);
    }
}

module tube(height,location) {
    translate([-1,location,height]) {
        rotate([0,90,0]) {
            cylinder(d=4,h=20); 
        }
    }
}