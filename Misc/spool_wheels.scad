//$fn=60;
$fa=5;
$fs=.4;

in_dia = 24;
in_width = 5.5;
wall_thick=2.4;
all_dia = 45;
tolerance = 0.6;

wheel_A();
translate([0,0,in_width+3*wall_thick+tolerance]) rotate([180,0,0]) wheel_B();

!for_print();

module for_print(){
    wheel_A();
    translate([48,0,0]) wheel_B();
}
    

module wheel_B(){
    difference(){
        cylinder(d=all_dia,h=wall_thick);
        cylinder(d=in_dia-2*wall_thick,h=wall_thick);
    }
    difference(){
        cylinder(d=in_dia-tolerance,h=2*wall_thick);
        cylinder(d=in_dia-2*wall_thick,h=2*wall_thick);
    }
}

module wheel_A(){
    difference(){
        cylinder(d=all_dia,h=wall_thick);
        cylinder(d=in_dia-2*wall_thick,h=wall_thick);
    }
    difference(){
        cylinder(d=in_dia+2*wall_thick,h=in_width+2*wall_thick);
        cylinder(d=in_dia,h=in_width+2*wall_thick);
    }
}
