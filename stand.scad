boxLength = 10;
boxWidth = 10;
boxHeight = 160;

casing();

module casing() {
    union() {
        //squareBox();
        UTowers();

        translate([0,boxHeight-boxWidth,0]) {
            UTowers();
        }
        
        translate([0,0,boxHeight-boxWidth]) {
            rotate([90,0,90]) {
                squareBox();
            }
        }
        
        supportBeamWidth=20;
        
        //Fix y translate. If the length and width change, the offset will be off.
        translate([boxHeight/2+(supportBeamWidth/2),5,boxHeight]) {
            rotate([0,90,90]) {
                cube([boxLength,supportBeamWidth,boxHeight-boxWidth]);
            }
        }
        
        //Lowering bars
        translate([boxHeight-(supportBeamWidth/2),(boxHeight/2)-(supportBeamWidth/2),boxHeight/2]) {
            rotate([0,0,0]) {
                cube([boxLength,supportBeamWidth,boxHeight/2]);
            }
        }
        
        translate([0,(boxHeight/2)-(supportBeamWidth/2),boxHeight/2]) {
            rotate([0,0,0]) {
                cube([boxLength,supportBeamWidth,boxHeight/2]);
            }
        }
        
        //Support for lower bars
//        translate([boxHeight-(supportBeamWidth/2),boxHeight-(supportBeamWidth/4),boxHeight/2]) {
//            rotate([90,0,0]) {
//                cube([boxLength,supportBeamWidth,boxHeight-boxWidth]);
//            }
//        }
//        
//        translate([0,boxHeight-(supportBeamWidth/4),boxHeight/2]) {
//            rotate([90,0,0]) {
//                cube([boxLength,supportBeamWidth,boxHeight-boxWidth]);
//            }
//        }

    }
}


module squareBox() {
    towers();
    translate([0,0,boxHeight]) {
        rotate([0,90,0]) {
            towers();
        }
    }
}

module towers(lOffset=0,wOffset=0) {
    cube([boxLength+lOffset,boxWidth+wOffset,boxHeight]);
    translate([(boxHeight-boxWidth)-lOffset,0,0]) {
        cube([boxLength+lOffset,boxWidth+wOffset,boxHeight]);
    }
}

module UTowers() {
    
    LengthOffset = boxLength+5;
    widthOffset = boxWidth+5;
    
    towers(LengthOffset,0);
    translate([0,0,boxHeight]) {
        rotate([0,90,0]) {
            cube([boxLength,boxWidth,boxHeight]);
        }
    }
}
