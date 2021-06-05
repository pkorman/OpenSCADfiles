//$fn=60;
$fa=5;
$fs=.4;

box();
translate([0,0,-7]) bottom_lid();

module box(){
    difference(){
        body();
        center_cut();
        translate([0,-29,3+6.5]) rotate([90,0,0]) switch();
        translate([0,32-14,4]) usb_con();
    }
}

module switch(){
    linear_extrude(height=1) circle(d=8);
    linear_extrude(height=9) circle(d=6.2);
    translate([0,0,-11]) linear_extrude(height=11) square([23,13.2],center=true);
}

module usb_con(){
    translate([0,0,-1.5]) linear_extrude(height=1.5) square([17,17],center=true);
    translate([0,7.5,0]) linear_extrude(height=7.4) square([14,23-9],center=true);
    translate([0,-4,0]) linear_extrude(height=6) square([17,9],center=true);
}
   
module body(){
    linear_extrude(height=18) hull(){
        translate([-15,28,0]) circle(d=8);
        translate([15,28,0]) circle(d=8);
        translate([-15,-28,0]) circle(d=8);
        translate([15,-28,0]) circle(d=8);
    }
}

module center_cut(){
    linear_extrude(height=3) hull(){
        translate([-12,25,0]) circle(d=6);
        translate([12,25,0]) circle(d=6);
        translate([-12,-25,0]) circle(d=6);
        translate([12,-25,0]) circle(d=6);
    }
    translate([-10,0,0]) linear_extrude(height=11) square([20,3.6],center=true);
    translate([0,-5,0]) linear_extrude(height=16.2) square([25,30],center=true);
}

module bottom_lid(){
    difference (){
        union(){
            linear_extrude(height=1.5) hull(){
                translate([-15,28,0]) circle(d=8);
                translate([15,28,0]) circle(d=8);
                translate([-15,-28,0]) circle(d=8);
                translate([15,-28,0]) circle(d=8);
            }
            linear_extrude(height=1.5+2.5) hull(){
                translate([-12,25,0]) circle(d=5.7);
                translate([12,25,0]) circle(d=5.7);
                translate([-12,-25,0]) circle(d=5.7);
                translate([12,-25,0]) circle(d=5.7);
            }
            translate([-9,0,0]) linear_extrude(height=1.5+2.5) square([20,3.6],center=true);
        }
        translate([0,0,1.5]) linear_extrude(height=5) square([23,70],center=true);
    }
}
