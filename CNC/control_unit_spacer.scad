//$fn=60;
$fa=5;
$fs=.4;

space_height = 7;

difference(){
    body_all();
    mounting_holes();
}

module body_all(){
    linear_extrude(height=space_height) hull(){
        translate([-15,0,0]) circle(d=16);
        translate([15,0,0]) circle(d=16);
    }
    
    translate([0,0,space_height]) linear_extrude(height=2) square([24,5],center=true);
}

module mounting_holes(){
    translate([0,0,-1]) linear_extrude(height=20){
        translate([-15,0,0]) circle(d=5.2);
        translate([15,0,0]) circle(d=5.2);
    }
}

