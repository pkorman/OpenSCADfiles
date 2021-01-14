//$fn=60;
$fa=5;
$fs=.4;

relay_dist_x=44.5/2;
relay_dist_y=20.5/2;

relay_offset_x=-10;
relay_offset_y=-12;

body();
translate([-101/2-1.6-(27.2+3.2)/2,0,0]) va_box();

module va_box(){
    difference(){
        translate([0,0,-1.6]) linear_extrude(height=38+1.6) square([27.2+3.2,46.4+3.2],center=true);
        linear_extrude(height=39) square([27.2,46.4],center=true);
        translate([10,51/2-15,5]) va_cord_hole();
    }
}


module body(){
    difference(){
        translate([2.2,0,-1.6]) outer_box();
        inner_box();
        power_cord();
        spindle_cord();
        translate([101/2,51/2-30.5,53]) mounting_screw_hole();
        translate([-101/2,51/2-15,5]) va_cord_hole();
        cut_off();
        translate([relay_offset_x,relay_offset_y,0]) relay_mount_holes();
    }
    //relay
    difference(){
        translate([relay_offset_x,relay_offset_y,0]) relay_stands();
        translate([relay_offset_x,relay_offset_y,0]) relay_mount_holes();
    }
}

module cut_off(){
    translate([101/2+1.6+2.2,-25,-5])
    linear_extrude(height=70) square([4.6,30],center=true);
    translate([101/2+1.6+2.2,25,-5])
    linear_extrude(height=70) square([4.6,30],center=true);
}

module outer_box(){
    linear_extrude(height=60+1.6) square([101+3.2+4.4,51+3.2],center=true);
}

module inner_box(){
    linear_extrude(height=70) square([101,51],center=true);
}

module power_cord(){
    translate([101/2+2.1,0,5])
    linear_extrude(height=70) square([4.5,6.4],center=true);
}

module spindle_cord(){
    translate([0,51/2-15,/*-1.4*/-5])
    linear_extrude(height=10) circle(d=6);
}

module mounting_screw_hole(){
    rotate([0,90,0]) 
    translate([0,0,-10]) linear_extrude(height=20) circle(d=3.6);
}

module va_cord_hole(){
    rotate([0,90,0]) 
    translate([0,0,-10]) linear_extrude(height=20) circle(d=10);
}

module relay_stands(){
    relay_stand(relay_dist_x,relay_dist_y);
    relay_stand(relay_dist_x,-relay_dist_y);
    relay_stand(-relay_dist_x,relay_dist_y);
    relay_stand(-relay_dist_x,-relay_dist_y);
}

module relay_mount_holes(){
    relay_mount_hole(relay_dist_x,relay_dist_y);
    relay_mount_hole(relay_dist_x,-relay_dist_y);
    relay_mount_hole(-relay_dist_x,relay_dist_y);
    relay_mount_hole(-relay_dist_x,-relay_dist_y);
}

module relay_stand(x=0,y=0){
    translate([x,y,0])
    linear_extrude(height=2.4){
        difference(){
            circle(d=6);
        }        
    }
}

module relay_mount_hole(x=0,y=0){
    translate([x,y,-1.4])
    linear_extrude(height=20){
        difference(){
            circle(d=3.6);
        }        
    }
}