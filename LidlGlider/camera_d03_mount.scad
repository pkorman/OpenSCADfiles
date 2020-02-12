//$fn=60;
$fa=5;
$fs=.4;

union(){
    side_part_head();
    translate([0,-16,0]) side_part_nut();
    translate([4.5,-11,3]) base();
}

module base(){
    difference(){
        cube([9,22,6],true);
        cylinder(d=6.4,h=3);
        translate([0,0,-3]) cylinder(d=3.5,h=6);
    }
}

module side_part_head(){
    rotate([90,0,0]) translate([4.5,6,0])
    difference(){
        side_part();    
        translate([0,6,0]) rotate([0,0,90]) cylinder(d=6.4,h=3);
    }  
}
 
module side_part_nut(){
    rotate([90,0,0]) translate([4.5,6,0])
    difference(){
        side_part();    
        translate([0,6,3]) rotate([0,0,90]) cylinder(d=6.4,h=3,$fn=6);
    }   
}

module side_part(){
    linear_extrude(height = 6) difference(){
        union(){
            square([9,12],true);
            translate([0,6,0]) circle(d=9);
        }
        translate([0,6,0]) circle(d=3.5);
    }
}
