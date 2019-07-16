//$fn=60;
$fa=5;
$fs=.4;
 
wall_thickness = 1.2;

translate([0,0,-2]) rotate([180,0,0]) mount_on_fuselage();
translate([14,18,0]) rotate([0,0,180]) motor_mount_0();
translate([0,-18,0]) rotate([0,0,0]) motor_mount_1();

module motor_mount_1(){
    difference(){
        motor_mount_base();
        motor_holes(3,4,20,20,0);
    }
}

module motor_mount_0(){
    difference(){
        motor_mount_base();
        motor_holes(2.4,4,16,12,45);
    }
}

module motor_mount_base(){
    difference(){
        union(){
            linear_extrude(height= 2) offset(r=1.8) fuselage_shape();
            mounting_spacers(8,9.6,24);
        }
        mounting_holes(8,9.6,24);
    }
 }

module motor_holes(hole_diameter, x_shift, x_distance, y_distance, z_angle){
    translate([x_shift,0,0]) cylinder(h=10,d=7);
    translate([x_shift,0,0]) {
        rotate([0,0,z_angle]) union(){
            translate([-x_distance/2,0,0]) cylinder(h=10,d=hole_diameter);
            translate([x_distance/2,0,0]) cylinder(h=10,d=hole_diameter);
            translate([0,-y_distance/2,0]) cylinder(h=10,d=hole_diameter);
            translate([0,y_distance/2,0]) cylinder(h=10,d=hole_diameter);
            
            //motor_boundary();
        }
    }
}

module motor_boundary() {
    motor_perimeter = 23;
    difference() {
                cylinder(h=0.5,d=motor_perimeter);
                cylinder(h=0.5,d=motor_perimeter-1);
    }
}

module mounting_spacers(up_x, up_y, bot_x){
    spacer_diameter = 8;
    spacer_height = 4.5;
    translate([-up_x,up_y,0]) cylinder(h=spacer_height,d=spacer_diameter);
    translate([-up_x,-up_y,0]) cylinder(h=spacer_height,d=spacer_diameter);
    translate([bot_x,0,0]) cylinder(h=spacer_height,d=spacer_diameter);
}

module mount_on_fuselage(){
    difference(){
        union(){
            linear_extrude(height= wall_thickness + 2.5) offset(r=1.5) fuselage_shape();
            linear_extrude(height= wall_thickness + 2.5 + 4) difference(){
                offset(r=1.8) fuselage_shape();
                offset(r=0.6) fuselage_shape();
            }
        }
        translate([0,0,-1]) linear_extrude(height=10) offset(r=-8) fuselage_shape();
        mounting_holes(8,9.6,24);
        mounting_hex(8,9.6,24);
    }
}

module mounting_holes(up_x, up_y, bot_x){
    translate([-up_x,up_y,-1]) cylinder(h=10,d=3.5);
    translate([-up_x,-up_y,-1]) cylinder(h=10,d=3.5);
    translate([bot_x,0,-1]) cylinder(h=10,d=3.5);
}

module mounting_hex(up_x, up_y, bot_x){
    translate([-up_x,up_y,wall_thickness]) rotate([0,0,-20]) cylinder(h=10,d=6.2,$fn=6);
    translate([-up_x,-up_y,wall_thickness]) rotate([0,0,20]) cylinder(h=10,d=6.2,$fn=6);
    translate([bot_x,0,wall_thickness]) rotate([0,0,90]) cylinder(h=10,d=6.2,$fn=6);
}

module fuselage_shape(){
    hull(){
        circle(d=32,center=true);
        translate([28-19.7/2,0,0]) circle(d=19.7,center=true);
    }
}
