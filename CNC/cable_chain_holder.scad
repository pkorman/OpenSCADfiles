//$fn=60;
$fa=5;
$fs=.4;


difference(){
    body();
    z_mountig_holes();
    cable_mounting_holes();
    other_zip_holes();
    xt60_hole();
}

module body(){
    linear_extrude(height=12) polygon(points=[
        [0,0],[27,0],[80+20,80-6],
        [80+20,80],[80,80],[0,6]
    ]);

    translate([80,80-6]) linear_extrude(height=20) square([20,6]);  
  
    linear_extrude(height=23) square([10,3]);  
    
    translate([0,0,23]) rotate([0,-90,-90]) zip_bracket();
}

module zip_bracket(){
    difference(){
        linear_extrude(height=3){
            square([7,10],center=false);
            translate([7,5]) circle(d=10);
        }
        translate([0,0,-1]) linear_extrude(height=5){
            translate([2,5]) circle(d=3.6);
            translate([9,5]) circle(d=3.6);
        }
    }
}

module z_mountig_holes(){
    translate([7,-1,6]){
    rotate([-90,0,0]) linear_extrude(height=40) circle(d=4.2);
    translate([15,0,0]) rotate([-90,0,0]) linear_extrude(height=40) circle(d=4.2);
    }
    translate([7,6,6]){
    rotate([-90,0,0]) linear_extrude(height=40) circle(d=8.4);
    translate([15,0,0]) rotate([-90,0,0]) linear_extrude(height=40) circle(d=8.4);
    }
}

module cable_mounting_holes(){
    m4_insert_hole(90,80-2,20-5);
    m4_insert_hole(90,80-2,20-5-7.5);
}

module m4_insert_hole(x=0,y=0,z=0){
    translate([x,y,z]) rotate([-90,0,0]){
        translate([0,0,-20]) linear_extrude(height=20){
            circle(d=5.2);
        }
        translate([0,0,0]) linear_extrude(height=20){
            circle(d=4.2);
        }
    }
} 

module other_zip_holes(){
    translate([30,28,-1]) linear_extrude(height=30) circle(d=3.6);
    translate([60,56,-1]) linear_extrude(height=30) circle(d=3.6);
}

module xt60_hole(){
    translate([42,27,-1]) rotate([0,0,45]) linear_extrude(height=20) square([15.6,8.4],center=true);
}
