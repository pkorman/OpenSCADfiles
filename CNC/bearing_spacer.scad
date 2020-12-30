//$fn=60;
$fa=5;
$fs=.4;


difference(){
    body_all();
    mounting_holes();
}

module body_all(){
    translate([0,0,2.5]) linear_extrude(height=5) square([55,14],center=true);
    translate([0,0,3.5]) linear_extrude(height=7) square([36,5],center=true);
}

module mounting_holes(){
    translate([0,0,-10]) linear_extrude(height=20){
        translate([-21,0,0]) circle(d=5.2);
        translate([21,0,0]) circle(d=5.2);
    }
}

