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
    end_stop_hole();
    cable_chain_holes();
}

module body_all(){
    h1=28;
    h2=28;
    h3=47;
    h4=36;
    
    linear_extrude(height=10){
        translate([0,h1/2,0]) square([88,h1],center=true);
        translate([0,43.5/2,0]) square([47,43.5],center=true);
    }
    
    
}


module end_stop_hole(){
    translate([0,43.5-4,5]) rotate([90,0,0]) insert_hole();
}

module cable_chain_holes(){
    translate([-27,6.5,5]) rotate([180,0,0]) insert_hole();
    translate([-27,21.5,5]) rotate([180,0,0]) insert_hole();
}



module motor_hole(){
    translate([0,20,9]) linear_extrude(height=20) square([43,43],center=true);
    translate([0,20,-1]) linear_extrude(height=12) circle(d=22.4);
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
    translate([0,50,5]) rotate([90,0,0]) linear_extrude(height=100){
        translate([-34,0,0]) circle(d=4.2);
        translate([34,0,0]) circle(d=4.2);
    }
}

module insert_hole(x=0,y=0){
    translate([x,y,0.2]) linear_extrude(height=10){
        circle(d=m4screwinsert);
    }
    translate([x,y,-10.2]) linear_extrude(height=10){
        circle(d=m4screwhole);
    }
} 

