//$fn=60;
$fa=5;
$fs=.4;

total_height = 32;
mount_hole_y = (total_height - 12) / 2;

difference(){
    body_all();
    holes();
}

module body_all(){
    linear_extrude(height=total_height){
        translate([0,-29.6/4,0]) square([29.6+22.4*2,29.6/2],center=true);
        translate([0,-29.6/2+4.5,0]) square([45.6*2,9],center=true);
        square([22.4*2,29.6],center=true);
        translate([22.4,0,0]) circle(d=29.6);
        translate([-22.4,0,0]) circle(d=29.6);
    }
}

module holes(){
    linear_extrude(height=50){
        rotate([0,0,45]){
            translate([8,0,0]) circle(d=3.6);
            translate([-8,0,0]) circle(d=3.6);
            translate([0,8,0]) circle(d=3.6);
            translate([0,-8,0]) circle(d=3.6);
        }
        translate([22.4,0,0]) circle(d=15.2);
        translate([-22.4,0,0]) circle(d=15.2);
        circle(d=9.2);
    }
    translate([0,0,4]) linear_extrude(height=46){
        circle(d=23.2);
    }
    translate([0,-29.6/2,total_height/2]) rotate([-90,0,0]) holes_for_tool();
}

module mount_hole(x=0,y=0){
    translate([x,y,4.5]) linear_extrude(height=5){
        circle(d=5.2);
    }
    translate([x,y,0]) linear_extrude(height=9){
        circle(d=4.2);
    }
}    

module holes_for_tool(){
    mount_hole(40,mount_hole_y);
    mount_hole(-40,mount_hole_y);
    mount_hole(40,-mount_hole_y);
    mount_hole(-40,-mount_hole_y);
}