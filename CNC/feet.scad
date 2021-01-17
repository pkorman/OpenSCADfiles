//$fn=60;
$fa=5;
$fs=.4;

rail_width = 20;
feet_lenght = 50;//70
feet_width = 35;
feet_height = 2;
lock_lenght = (feet_lenght-7)/2;
lock_width = 5;
screw_distance_x = (feet_lenght)/2-7.5;
screw_distance_y = (feet_width + rail_width)/4;

rail_hole = 5.2;
screw_hole = 3.6;

echo(screw_distance_x);
echo(screw_distance_y);

difference(){
    body_all();
    translate([0,0,0.2]) mounting_holes();
}

module body_all(){
    linear_extrude(height=feet_height) square([feet_lenght,feet_width],center=true);
    
    lock(-feet_lenght/2+lock_lenght/2);
    lock(feet_lenght/2-lock_lenght/2);
    
    //linear_extrude(height=20) square([feet_lenght,20],center=true);
}

module lock(x=0){
    translate([x,0,0]) linear_extrude(height=feet_height+2) square([lock_lenght,lock_width],center=true);
}

module mounting_holes(){
    holes_height = 10;
    linear_extrude(height=holes_height){
        circle(d=rail_hole);
    }
    linear_extrude(height=holes_height){
        translate([screw_distance_x,screw_distance_y,0]) circle(d=screw_hole);
        translate([screw_distance_x,-screw_distance_y,0]) circle(d=screw_hole);
        translate([-screw_distance_x,screw_distance_y,0]) circle(d=screw_hole);
        translate([-screw_distance_x,-screw_distance_y,0]) circle(d=screw_hole);
    }    
}

