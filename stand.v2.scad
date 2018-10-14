$fs=1;
boxLength = 10;
boxWidth = 10;
boxHeight = 140;

stiltTowerHeight = 80;
shaftHeight = 80;

casing();

module casing() {
    union() {
        UTowersWithHoles(25,boxWidth-5);

        translate([0,shaftHeight,0]) {
            UTowersWithHoles(25,boxWidth-11);
        }
        
        translate([0,0,stiltTowerHeight]) {
            rotate([-90,0,0]) {
                #towers(0,0); //For support
            }
        }
    }
}

module towers(lOffset=0,wOffset=0) {
    cube([boxLength+lOffset,boxWidth+wOffset,shaftHeight+10]);
    translate([(boxHeight-boxWidth)-lOffset,0,0]) {
        cube([boxLength+lOffset,boxWidth+wOffset,shaftHeight+10]);
    }
}

module standsForHeight(lOffset=0,wOffset=0) {
    cube([boxLength+lOffset,boxWidth+wOffset,stiltTowerHeight]);
    translate([(boxHeight-boxWidth)-lOffset,0,0]) {
        cube([boxLength+lOffset,boxWidth+wOffset,stiltTowerHeight]);
    }
}

module UTowers() {
    
    LengthOffset = boxLength+5;
    widthOffset = boxWidth+5;
    
    towers(0,0);
    translate([0,0,boxHeight]) {
        rotate([0,90,0]) {
            cube([boxLength,boxWidth,boxHeight]);
        }
    }
}

module UTowersWithHoles(x_hole_offset,y_hole_offset) {
    
    LengthOffset = boxLength;
    widthOffset = boxWidth;
    
    //towers(0,0);
    standsForHeight(lOffset=0,wOffset=0);
    translate([0,0,stiltTowerHeight]) {
        rotate([0,90,0]) {
            difference() {
                cube([boxLength,boxWidth,boxHeight]);
                
                translate([5,y_hole_offset,boxHeight/2-25]) { //(z,y,x)
                    rotate([0,90,90]) {
                        cylinder(d=3.5,h=6);
                    }
                }
                
                translate([5,y_hole_offset,boxHeight/2+25]) {
                    rotate([0,90,90]) {
                        cylinder(d=3.5,h=6);
                    }
                }
            }
        }
    }
}