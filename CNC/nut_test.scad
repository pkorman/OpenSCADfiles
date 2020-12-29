//$fn=60;
$fa=5;
$fs=.4;

difference(){
    body_all();
    mount_hole_for_nut();
}

module body_all(){
    linear_extrude(height=7){
        square([15,20],center=true);
    }
}

module mount_hole_for_nut(x=0,y=0){
    translate([x,y,0]){
        linear_extrude(height=10){
            square([6,6],center=true);
        }
        translate([0,0,2]) linear_extrude(height=10){
            square([6,10],center=true);
        }
    }
}

