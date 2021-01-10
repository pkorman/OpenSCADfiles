//$fn=60;
$fa=5;
$fs=.4;


difference(){
    body_all();
    mounting_holes();
}

module body_all(){
    difference(){
        body();
        cutoff();
    }
}

module mounting_holes(){
    translate([0,0,4.6]) linear_extrude(height=20){
        translate([-15,0,0]) circle(d=4.4);
        translate([15,0,0]) circle(d=4.4);
    }
    translate([0,0,-1]) linear_extrude(height=30){
        translate([0,-16,0]) circle(d=3.4);
        translate([0,16,0]) circle(d=3.4);
    }
}

module body(){
    hull(){
        translate([0,0,11+4.2]) linear_extrude(height=0.2) hull(){
            translate([-15,0,0]) circle(d=16);
            translate([15,0,0]) circle(d=16);
        }
        
        linear_extrude(height=6) hull(){
            translate([-15,0,0]) circle(d=16);
            translate([15,0,0]) circle(d=16);
            translate([0,-16,0]) circle(d=16);
            translate([0,16,0]) circle(d=16);
        }
    }
    translate([0,0,11+4.4]) linear_extrude(height=2) square([24,5],center=true);
}

module cutoff(){
     translate([-15,0,-0.2]) linear_extrude(height=4.6) circle(d=12);
     translate([15,0,-0.2]) linear_extrude(height=4.6) circle(d=12);

     translate([0,-16,6]) linear_extrude(height=10) circle(d=10);
     translate([0,16,6]) linear_extrude(height=10) circle(d=10);
}
