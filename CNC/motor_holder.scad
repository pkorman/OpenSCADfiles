//$fn=60;
$fa=5;
$fs=.4;

m4screwhole = 4.2;
m4screwinsert = 5.2;

difference(){
    body_all();
    motor_hole();
    motor_mounting_holes();
    mounting_holes();
    
}

module body_all(){
    linear_extrude(height=10){
        translate([0,3,0]) square([88,6],center=true);
        translate([0,43.5/2,0]) square([47,43.5],center=true);
    }
    cable_mount();
}

module cable_mount(){
    difference(){
        translate([0,0,10]) hull(){
            translate([0,-1,5]) linear_extrude(height=7) square([66,14],center=true);
            translate([0,3,0]) linear_extrude(height=1) square([88,6],center=true);
        }
        translate([0,-5.5,0]) linear_extrude(height=30) square([43,10],center=true);
        cable_mount_holes();
    }
}

module cable_mount_holes(){
    translate([27,-m4screwinsert/2,10]) insert_hole();
    translate([-27,-m4screwinsert/2,10]) insert_hole();
}


module motor_hole(){
    translate([0,20,9]) linear_extrude(height=20) square([43,43],center=true);
    translate([0,20,-1]) linear_extrude(height=12) circle(d=21);
}

module motor_mounting_holes(){
    motor_mounting_hole(-31/2,20-31/2);
    motor_mounting_hole(-31/2,20+31/2);
    motor_mounting_hole(31/2,20-31/2);
    motor_mounting_hole(31/2,20+31/2);
}

module motor_mounting_hole(x=0,y=0){
    translate([x,y,3.4]) linear_extrude(height=12) circle(d=3.5);
    translate([x,y,-1]) linear_extrude(height=4) circle(d=7);
}


module mounting_holes(){
    translate([0,10,5]) rotate([90,0,0]) linear_extrude(height=20){
        translate([-34,0,0]) circle(d=4.2);
        translate([34,0,0]) circle(d=4.2);
    }
}

module insert_hole(x=0,y=0){
    translate([x,y,0]) linear_extrude(height=6){
        circle(d=m4screwinsert);
    }
    translate([x,y,6.4]) linear_extrude(height=10){
        circle(d=m4screwhole);
    }
} 

