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
    h1=28;
    h2=28;
    h3=47;
    h4=36;
    difference(){
        linear_extrude(height=23){
            translate([0,h1/2,0]) square([88,h1],center=true);
            translate([0,h2/2,0]) square([40,h2],center=true);
            hull(){
                translate([0,h3/2,0]) square([36,h3],center=true);
                translate([0,20,0]) circle(d=40);
            }
        }
        translate([0,0,10]) linear_extrude(height=20){
            translate([0,(h4-1)/2,0]) square([90,h4+1],center=true);
        }
    }
}

module bearing_hole(){
    translate([0,20,3]) linear_extrude(height=8) circle(d=22);
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
    translate([0,50,5]) rotate([90,0,0]) linear_extrude(height=100){
        translate([-34,0,0]) circle(d=4.2);
        translate([34,0,0]) circle(d=4.2);
    }
}

