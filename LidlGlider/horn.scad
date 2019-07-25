//$fn=60;
$fa=5;
$fs=.4;

horn();
translate([0,22,0]) horn();

module horn(){
    difference(){
        linear_extrude(height=1) union(){
            hull(){
                translate([0,5,0]) square([18,0.2]);
                translate([23,16,0]) circle(d=6);
                translate([24,18,0]) circle(d=4);
                translate([22,17,0]) circle(d=6);
            }
            square([18,5]);
        }
        translate([24,18,-5]) cylinder(h=10,d=1);
    }
}