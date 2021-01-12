//$fn=60;
$fa=5;
$fs=.4;

difference(){
    linear_extrude(height=3) circle(d=32);
    translate([0,0,-1]) linear_extrude(height=10) circle(d=12);
    antirot_hole(-27/2);
    antirot_hole(27/2);
}

module antirot_hole(x=0){
    translate([x,0,-1]) linear_extrude(height=10) circle(d=3);
}