//$fn=60;
$fa=5;
$fs=.4;

d1 = 3.6;
m1 = 2.5;
d2 = 5.2;
m2 = 2.5;
l1 = 22;
h1 = 3;
h2 = 2;
hi = 5;

//spk_insert();
hook();



module hook(){
    difference(){
        hook_body();
        hook_hole();
    }
}

module hook_body(){
    linear_extrude(height=10) difference(){
        union(){
            translate([-20,10]) square([20,5]);
            translate([-25,7.5]) square([25,2.5]);
            translate([-5,0]) square([5,10]);
            
            translate([-22.5,7.5]) circle(d=5);
            translate([-12.5,7.5]) circle(d=5);
            
            translate([-20,10]) difference(){
                circle(d=10);
                square([5,5]);
                translate([-5,-5]) square([10,5]);
            }
            
            difference(){
                square([15,15]);
                translate([15,15]) circle(d=20);
            }
        }
        translate([-7.5,7.5]) circle(d=5);
        translate([-17.5,7.5]) circle(d=5);
    }
}

module hook_hole(){
    translate([0,0,5])  
        rotate([90,0,0])
            translate([0,0,-20])
                linear_extrude(height=40) circle(d=3.6);
}


module spk_insert(){
    difference(){
        union(){
            linear_extrude(height=h1) hull(){
                translate([-l1/2,0]) circle(d=m1*d1);
                translate([l1/2,0]) circle(d=m1*d1);
                circle(d=m2*d2);
            }
            linear_extrude(height=h2+hi) circle(d=m2*d2);
        }
        
        translate([0,0,-1]) linear_extrude(height=15) circle(d=d1);
        translate([-l1/2,0,-1]) linear_extrude(height=15) circle(d=d1);
        translate([l1/2,0,-1]) linear_extrude(height=15) circle(d=d1);
        translate([0,0,h2]) linear_extrude(height=15) circle(d=d2);
    }
}
