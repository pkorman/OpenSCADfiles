//$fn=60;
$fa=5;
$fs=.4;

height_frame = 4;
height_switch = 12;

difference(){
    body_all();
    mounting_holes();
}

module body_all(){
    linear_extrude(height=height_frame) hull(){
        translate([0,0,0]) circle(d=18);
        translate([0,-11.5,0]) square(size=[18, 23], center=true);
    }
    
    linear_extrude(height=height_switch) hull(){
        translate([0,-16.5,0]) square(size=[18, 13], center=true);
    }
}

module mounting_holes(){
    translate([0,0,-1]) linear_extrude(height=20) hull(){
        translate([0,2,0]) circle(d=5.2);
        translate([0,-2,0]) circle(d=5.2);
    }

    translate([0,0,-1]) linear_extrude(height=4) hull(){
        translate([0,2,0]) circle(d=8);
        translate([0,-2,0]) circle(d=8);
    }

    translate([0, -16.5, 0]) {
        translate([13/2, -8/2, -1]) linear_extrude(height=height_switch+2) circle(d=2.4);
        translate([-13/2, 8/2, -1]) linear_extrude(height=height_switch+2) circle(d=2.4);

        translate([13/2, -8/2, -1]) linear_extrude(height=height_switch-1) circle(d=4);
        translate([-13/2, 8/2, -1]) linear_extrude(height=height_switch-1) circle(d=4);
    }
}

