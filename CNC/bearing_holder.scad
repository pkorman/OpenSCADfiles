//$fn=60;
$fa=5;
$fs=.4;


difference(){
    body_all();
    bearing_hole();
    bearing_removal_holes();
    mounting_holes();
}

module body_all(){
    linear_extrude(height=10){
        translate([0,3,0]) square([88,6],center=true);
        translate([0,10,0]) square([40,20],center=true);
        translate([0,20,0]) circle(d=40);
    }
}

module bearing_hole(){
    translate([0,20,3]) linear_extrude(height=8) circle(d=22.5);
    translate([0,20,-1]) linear_extrude(height=8) circle(d=15);
}

module bearing_removal_holes(){
    removal_hole_diameter = 3.5;
    linear_extrude(height=12){
        translate([0,8.75,-1]) circle(d=removal_hole_diameter);
        translate([0,31.25,-1]) circle(d=removal_hole_diameter);
        translate([11.25,20,-1]) circle(d=removal_hole_diameter);
        translate([-11.25,20,-1]) circle(d=removal_hole_diameter);
    }
}

module mounting_holes(){
    translate([0,10,5]) rotate([90,0,0]) linear_extrude(height=20){
        translate([-34,0,0]) circle(d=4.2);
        translate([34,0,0]) circle(d=4.2);
    }
}

