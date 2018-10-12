boxLength = 10;
boxWidth = 10;
boxHeight = 180;

casing();

module casing() {
    union() {
        squareBox();

        translate([0,boxHeight-boxWidth,0]) {
            squareBox();
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

module towers() {
    cube([boxLength,boxWidth,boxHeight]);
    translate([boxHeight-boxWidth,0,0]) {
        cube([boxLength,boxWidth,boxHeight]);
    }
} 
