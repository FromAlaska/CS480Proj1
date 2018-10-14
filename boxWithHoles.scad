$fs=0.1;
boxLength = 10;
boxWidth = 60;

makesHoles();

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