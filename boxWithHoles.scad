$fs=0.1;
boxLength = 10;
boxWidth = 60;

boxHeight = 85;

sideHeight = 20;
spaceLength = 16;

shaftHolder();

module shaftHolder() {
    union() {
        translate([boxHeight,0,0]) {
            makesHoles();
        }
        mirror([0,0,0]) {
            translate([0,boxWidth,0])
            rotate([0,0,180]) {
                makesHoles();
            }
        }
        
        difference() {
            translate([-10,boxWidth,0]) {
                rotate([90,0,90])
                cube([10,30,boxHeight+20]);
            }
            translate([boxHeight,boxWidth-5,20]) {
                rotate([0,90,0]) {
                    #cylinder(d=15,h=11);
                }
            }
        }
        
        //mirroredCubes();
    }
}

module mirroredCubes(cubeHeight) {
    translate([boxHeight,boxWidth,0]) {
        cube([10,spaceLength,10]);
    }
    
    translate([-10,boxWidth,0]) {
        cube([10,spaceLength,10]);
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
            #cylinder(d=3.5,h=7); 
        }
    }
}