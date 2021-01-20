//$fn=60;
$fa=5;
$fs=.4;

feet_lenght = 42;
feet_width = 16;
feet_height = 9+2;
lock_lenght = feet_lenght - feet_width - 6;
lock_width = 5;

circle_dist = (feet_lenght - feet_width)/2;


difference(){
    body_all();
    rubber_feet_hole(x=circle_dist);
    rubber_feet_hole(x=-circle_dist);
    screw_hole();
}

module body_all(){
    linear_extrude(height=feet_height) hull(){
        translate([circle_dist,0,0]) circle(d=feet_width);
        translate([-circle_dist,0,0]) circle(d=feet_width);
    }    
    lock();
}

module screw_hole(){
    translate([0,0,-0.1]){
        translate([0,0,feet_height-2.6]) linear_extrude(height=20) circle(d=5.2);
        linear_extrude(height=feet_height-2.9) circle(d=10);
    }
    translate([0,0,feet_height]) linear_extrude(height=5) square([6.4,lock_width+0.1],center=true);
}

module rubber_feet_hole(x=0){
    translate([x,0,-0.1]){
        hull(){
            translate([0,0,9])linear_extrude(height=0.1) circle(d=4.4);
            linear_extrude(height=3.1) circle(d=10.4);
        }
        linear_extrude(height=20) circle(d=4.4);
    }
}

module lock(x=0){
    translate([x,0,0]) linear_extrude(height=feet_height+2) square([lock_lenght,lock_width],center=true);
}
