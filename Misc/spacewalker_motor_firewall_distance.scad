//$fn=60;
$fa=5;
$fs=.4;

holeA = [-23,19,0];
holeB = [23,19,0];
holeC = [-23,-19,0];
holeD = [23,-19,0];

 
difference(){
    base_shape();
    insert_hole(holeA);
    insert_hole(holeB);
    insert_hole(holeC);
    insert_hole(holeD);
    translate([0,-20,7]) cube([36,36,9],center=true);
}



module insert_hole(place){
    translate([place[0],place[1],0]){
        //translate([0,0,0.8]) cylinder(h=6,d=5.2);
        translate([0,0,-0.8]) cylinder(h=16,d=3.2);
    }
}


module base_shape(){
    linear_extrude(height=11){
        translate(holeA) circle(d=10);
        translate(holeB) circle(d=10);
        translate(holeC) circle(d=10);
        translate(holeD) circle(d=10);
        difference(){
            square([48,40],center=true);
            square([44,36],center=true);
        }
    }
}
