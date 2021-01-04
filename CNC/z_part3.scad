//$fn=60;
$fa=5;
$fs=.4;

part_height = 12.5;
part_deep = 48;
part_width = 92;

nut6_height = 5.4;
nut6_diameter = 11.6;
nut6_hole_diameter = 7;

screw_hole = 4.6;

switch_width=36;
switch_deep=18;

channel_size = 3;

main();
//test();

module main(){
    difference(){
        body_all();
        holes();
    }
}

module test(){
    difference(){
        linear_extrude(height=part_height) square([15,35],center=true);
        nut6_hole_pair(0,20);
    }
}

module body_all(){
    linear_extrude(height=part_height) square([part_width,part_deep],center=true);
}

module holes(){
    nut6_hole_pair(-35,20);
    nut6_hole_pair(35,20);
     
    screw_hole(-40,18);
    screw_hole(-40,-18);
    screw_hole(40,18);
    screw_hole(40,-18);
    
    switch_hole(0,part_deep/2-switch_deep/2);
    switch_hole(0,-part_deep/2+switch_deep/2);
    
    cable_channel();
}

module nut6_hole_pair(x=0,distance=0){
    //hull() {
    translate([x,distance/2,part_height-nut6_height]) linear_extrude(height=nut6_height) circle(d=nut6_diameter,$fn=6);
    translate([x,-distance/2,part_height-nut6_height]) linear_extrude(height=nut6_height) circle(d=nut6_diameter,$fn=6);
    
    translate([x,0,part_height-nut6_height]) linear_extrude(height=nut6_height) circle(d=nut6_diameter,$fn=6);
    
    //}
    translate([x,distance/2,0])linear_extrude(height=part_height) circle(d=nut6_hole_diameter);
    translate([x,-distance/2,0])linear_extrude(height=part_height) circle(d=nut6_hole_diameter);
}

module screw_hole(x=0,y=0){
    translate([x,y,0])linear_extrude(height=part_height) circle(d=screw_hole);
}

module switch_hole(x=0,y=0){
    translate([x,y,0]) linear_extrude(height=part_height) square([switch_width,switch_deep],center=true);
}

module cable_channel(){
    height_offset = channel_size/3;
    
    translate([0,0,height_offset]) rotate([0,45,0]) translate([0,0,-channel_size/2]) linear_extrude(height=channel_size) square([channel_size,part_deep],center=true);
    translate([0,0,height_offset]) rotate([45,0,0]) translate([part_width/4,0,-channel_size/2]) linear_extrude(height=channel_size) square([part_width/2,channel_size],center=true); 
    
    translate([0,0,height_offset]) channel_round_cut();    
}

module channel_round_cut(){
    rotate([0,0,90]){
        half_channel_round_cut();
        mirror([1,0,0]) half_channel_round_cut();
    }
}

module half_channel_round_cut(){
    channel_diagonal = sqrt(2*pow(channel_size,2));
    
    translate([-channel_diagonal,-channel_diagonal,0]) difference(){
        rotate_extrude(angle=90) translate([channel_diagonal,0,0]){
            rotate([0,0,45]) square([channel_size,channel_size],center=true);
            translate([channel_diagonal/2,0,0]) square([channel_diagonal,channel_diagonal],center=true);
        }

        translate([channel_diagonal*1.5,0,-channel_size]) linear_extrude(height=channel_size*2) square([channel_diagonal,channel_size*8],center=true);
        translate([0,channel_diagonal*1.5,-channel_size]) linear_extrude(height=channel_size*2) square([channel_size*8,channel_diagonal],center=true);
    }
}