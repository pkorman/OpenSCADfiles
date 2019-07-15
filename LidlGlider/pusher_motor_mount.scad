//$fn=60;
$fa=5;
$fs=.4;
 
wall_thickness = 1.2;
 
difference(){
    union(){
        linear_extrude(height= wall_thickness + 2.5) offset(r=1.5) fuselage_shape();
        linear_extrude(height= wall_thickness + 2.5 + 4) difference(){
            offset(r=1.8) fuselage_shape();
            offset(r=0.6) fuselage_shape();
        }
    }
    translate([0,0,-1]) linear_extrude(height=10) offset(r=-8) fuselage_shape();
    mounting_holes();
}

module mounting_holes(){
    translate([-8,9.6,0]) {
        translate([0,0,-1]) cylinder(h=10,d=3.5);
        translate([0,0,wall_thickness]) rotate([0,0,-20]) cylinder(h=10,d=6.2,$fn=6);
    }
    translate([-8,-9.6,0]){
        translate([0,0,-1]) cylinder(h=10,d=3.5);
        translate([0,0,wall_thickness]) rotate([0,0,20]) cylinder(h=10,d=6.2,$fn=6);
    }
    translate([28-4,0,0]){
        translate([0,0,-1]) cylinder(h=10,d=3.5);
        translate([0,0,wall_thickness]) rotate([0,0,90]) cylinder(h=10,d=6.2,$fn=6);
    }
}

module fuselage_shape(){
    hull(){
        circle(d=32,center=true);
        translate([28-19.7/2,0,0]) circle(d=19.7,center=true);
    }
}
