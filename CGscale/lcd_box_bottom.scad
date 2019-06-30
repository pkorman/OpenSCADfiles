//$fn=60;
$fa=5;
$fs=.4;

base_height = 2;
bracket_height = 5;

difference(){
    base_box();
    cube([20.4,10.4,3],center=true);
    cube([19,9,10],center=true);
}


module base_box(){
    union() {
        translate([0,0,base_height/2]) cube([86,41,base_height],center=true);
        translate([-1+81/2,0,bracket_height/2]) cube([2,10,bracket_height],center=true);
        translate([1-81/2,0,bracket_height/2]) cube([2,10,bracket_height],center=true);
        translate([0,-1+37/2,bracket_height/2]) cube([40,2,bracket_height],center=true);
        translate([0,1-37/2,bracket_height/2]) cube([40,2,bracket_height],center=true);
        translate([0,0,1.5]) cube([22,12,3],center=true);
    }
}
