//$fn=60;
$fa=5;
$fs=.4;

horn();//for X
translate([0,-15]) horn(part_width=34);//for Y


module horn(part_width=48){
    difference(){
        body_all(part_width);
        holes(part_width);
    }
}

module body_all(part_width){
    translate([0,0,-2]) linear_extrude(height=6) square([part_width+4,8],center=true);
    linear_extrude(height=25) square([part_width-2*13,8],center=true);
}

module holes(part_width){
    translate([0,0,-3]) linear_extrude(height=3) square([part_width+1,10],center=true);

    translate([-part_width/2+7,0,-1]) linear_extrude(height=10) circle(d=3.6);
    translate([part_width/2-7,0,-1]) linear_extrude(height=10) circle(d=3.6);

    translate([0,0,18]) rotate([90,0,0]) translate([0,0,-5]) linear_extrude(height=10) hull(){
        translate([0,1]) circle(d=3.6);
        translate([0,-1]) circle(d=3.6);
    }
}