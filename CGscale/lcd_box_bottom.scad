//$fn=60;
$fa=5;
$fs=.4;

difference(){
    base_box();
    cube([20.4,10.4,4],center=true);
    cube([19,9,10],center=true);
}


module base_box(){
    union() {
        cube([86,41,1],center=true);
        translate([-1+81/2,0,1]) cube([2,10,3],center=true);
        translate([1-81/2,0,1]) cube([2,10,3],center=true);
        translate([0,-1+37/2,1]) cube([40,2,3],center=true);
        translate([0,1-37/2,1]) cube([40,2,3],center=true);
        translate([0,0,1]) cube([22,12,3],center=true);
    }
}
/*
difference(){
    union(){
        base_box();
        translate([0,18,0]) cylinder(d=8,h=2);
        translate([50,18,0]) cylinder(d=8,h=2);
        translate([20,-5,0]) cube([20,10,8]);
    }
    translate([0,18,0]) cylinder(d=3,h=5);
    translate([50,18,0]) cylinder(d=3,h=5);
    translate([21.5,-15,20]) cube([17,20,15]);
    translate([10,60,7]) cube([38,20,25]);
    translate([5,-15,25]) cube([7,20,15]);
}

module base_box(){
    difference(){
        linear_extrude(height=30) hull(){
                circle(r=10);
                translate([50,0,0]) circle(r=10);
                translate([0,60,0]) circle(r=10);
                translate([50,60,0]) circle(r=10);
        }
        translate([1,1,1]) linear_extrude(height=40) 
            hull(){
                circle(r=9);
                translate([48,0,0]) circle(r=9);
                translate([0,58,0]) circle(r=9);
                translate([48,58,0]) circle(r=9);
            }
    }
}
*/