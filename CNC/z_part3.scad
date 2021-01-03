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

channel_size = 4;

difference(){
    body_all();
    holes();
    
    //nut6_hole_pair();
}

module body_all(){
    linear_extrude(height=part_height) square([part_width,part_deep],center=true);
    
    //linear_extrude(height=part_height) square([15,15],center=true);
    
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
    hull() {
        translate([x,distance/2,part_height-nut6_height]) linear_extrude(height=nut6_height) circle(d=nut6_diameter,$fn=6);
        translate([x,-distance/2,part_height-nut6_height]) linear_extrude(height=nut6_height) circle(d=nut6_diameter,$fn=6);
    }
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
    translate([0,0,0]) linear_extrude(height=channel_size) square([channel_size,part_deep],center=true);
    translate([part_width/4,0,0]) linear_extrude(height=channel_size) square([part_width/2,channel_size],center=true);   
}