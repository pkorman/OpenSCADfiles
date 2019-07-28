//$fn=60;
$fa=5;
$fs=.4;

cam_mount();
translate([0,0,13]) plug();

module cam_mount(){
    difference(){
        union(){    
            cylinder(d=10,h=25);
            hull(){
                translate([0,0,15]) cylinder(d=10,h=1);
                translate([0,0,20]) cylinder(d=12,h=5);
            }
        }
        cylinder(d=3.6,h=25);
        translate([0,0,10]) cylinder(d=6.4,h=15,$fn=6);
    }
}

module plug(){
    difference(){
        cylinder(d=5.8,h=12,$fn=6);
        cylinder(d=3.6,h=25);
    }
}