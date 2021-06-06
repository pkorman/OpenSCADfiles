//$fn=60;
$fa=5;
$fs=.4;

difference(){
    union(){
        linear_extrude(height=1) circle(d=16);
        linear_extrude(height=3.2) circle(d=8.4);
    }
    translate([0,0,1]) linear_extrude(height=5) square([5.6,5.6],center=true);
}

