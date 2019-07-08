//$fn=60;
$fa=5;
$fs=.4;

main();
translate([0,0,4.7]) rotate([180,0,0]) main();

module main() {
    difference(){
        linear_extrude(height=2.3) base_shape();
        translate([0,0,1]) linear_extrude(height=2) inner_shape();
        translate([0,0,2]) cube([20,7,2],center=true);
    }
}

module inner_shape(){
    offset(r=-1) base_shape();
    translate([6,0,0]) square([6,11],center=true);
}

module base_shape(){
    hull(){
        circle(d=13);
        translate([6.5,0,0]) square([4,13],center=true);
    }
}
