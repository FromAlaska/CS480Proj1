$fs=0.1;
boxLength = 10;
boxWidth = 60;

makesHoles();
cutSquareBox(0,-10,0,0,0);
cutSquareBox(0,boxWidth,0,0,10);

sideBars(0,-20,boxWidth-15,0,0);
sideBars(0,boxWidth+10,boxWidth-15,0,-10);

module sideBars(xbox,ybox,zbox,cubeX,cubeY) {
    translate([xbox,ybox,zbox]) {
        difference() {
            cube([10,10,15]);
            translate([cubeX-1,cubeY+5,5]) { 
                #cube([12,10,12]);
            }
        }
    }
}


module cutSquareBox(xbox,ybox,zbox,cubeX,cubeY) {
    translate([xbox,ybox,zbox]) {
        difference() {
            cube([10,10,60]);
            translate([cubeX-1,cubeY-5,50]) { 
                #cube([12,10,12]);
            }
        }
    }
}

module makesHoles() {
    union() {
        difference() {
            squareBox(boxLength,boxWidth);
            tube(5,5);
            tube(5,boxWidth-5);
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