//$fn=60;
$fa=5;
$fs=.4;

body();

module body(){
    difference(){
        union(){
            difference(){
                base_shape(wall=2);
                base_shape();
            }
            kross();
            clamp();
        }
        cable_cut();
        split_cut();
    }   
}

module clamp(){
    translate([-(63/2+5),4,5]) rotate([90,0,0]) 
    difference(){
        linear_extrude(height=8){
            circle(d=10);
            translate([2.5,0,0]) square([5,10],center=true);
        }
        translate([0,0,-1]) linear_extrude(height=10) circle(d=3.2);
    }
}

module cable_cut(){
    rotate([0,90,0]) linear_extrude(height=40){
        translate([-5,0,0]) circle(d=10);
        square([10,10],center=true);
    }
}

module split_cut(){
    translate([-35,0,-1]) linear_extrude(height=40) square([20,2],center=true);
}

module base_shape(wall=0){
    translate([0,0,17]) linear_extrude(height=10) circle(d=63+2*wall);
    translate([0,0,10]) hull(){
        translate([0,0,7]) linear_extrude(height=0.1) circle(d=63+2*wall);
        linear_extrude(height=0.1) circle(d=60+2*wall);
    }
    linear_extrude(height=10) circle(d=60+2*wall);
}

module kross(){
    difference(){
        rotate([0,0,45]) linear_extrude(height=10){
            square([64,3],center=true);
            square([3,64],center=true);
        }
        translate([0,0,-1]) linear_extrude(height=12) circle(d=52);
    }
}

