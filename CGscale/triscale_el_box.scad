//$fn=60;
$fa=5;
$fs=.4;

hex_nut_hole = 6.4;

main_box();

translate([0,0,22]){
    rotate([0,180,0]){
        box_lid();
    }
}

module box_lid(){
    difference(){
        union(){
            linear_extrude(height=2) offset(r=2) base_shape();
            linear_extrude(height=4.5) offset(r=-.6) base_shape();
            translate([-19.4,29.4,0]) cube([38.8,2.6,10]);
        }
        translate([20,-5,-1]) cylinder(d=3.5,h=30);
        translate([-20,-5,-1]) cylinder(d=3.5,h=30);
        translate([-7.5,-30,-1]) cube([15,10,10]);
    }
}

module main_box(){
    difference(){
        union(){
            base_bottom();
            base_wall();
            union(){
                translate([-20,25.2,0]) cube([40,4.8,7]);
                translate([-20,-5,0]) cube([15,5,7]);
                translate([20,5,0]) cylinder(d=10.2,h=5);
                translate([20,-5,0]) cylinder(d=10.2,h=17);
                translate([-20,-5,0]) cylinder(d=10.2,h=17);
            }
            box_holder();
        }
        translate([-20,25,7]) cube([40,10,30]);
        
        translate([20,5,-1]) cylinder(d=3.5,h=15);
        translate([20,5,-1]) cylinder(d=hex_nut_hole,h=4,$fn=6);
        
        translate([20,-5,-1]) cylinder(d=3.5,h=30);
        translate([-20,-5,-1]) cylinder(d=3.5,h=30);
        
        translate([20,-5,-1]) cylinder(d=hex_nut_hole,h=11,$fn=6);
        
        translate([-20,-5,-1]) cylinder(d=hex_nut_hole,h=11,$fn=6);
    }
}

module box_holder(){
    union(){
        difference(){
            hull(){
                translate([-32,0,0]) cylinder(d=10,h=3);
                translate([32,0,0]) cylinder(d=10,h=3);
            }
            translate([-25,-10,2]) cube([50,20,10]);
            translate([-32,0,-1]) cylinder(d=3.5,h=10);
            translate([32,0,-1]) cylinder(d=3.5,h=10);
        }
    }
}

module base_bottom(){
    linear_extrude(height=2){
        base_shape();
    }
}

module base_wall(){
    linear_extrude(height=20){
        difference(){
            offset(r=2) base_shape();
            base_shape();
        }
    }
}

module base_shape(){
    hull(){
        translate([-20,-20,0]) circle(r=5);
        translate([20,-20,0]) circle(r=5);
        translate([20,25,0]) circle(r=5);
        translate([-20,25,0]) circle(r=5);
    }
}
