//$fn=60;
$fa=5;
$fs=.4;

holes_x_dist = 102;
holes_y_dist = 32;
holes_x_offset = -12;
h1x = 0;                                h1y = 0;
h2x = holes_x_dist;                     h2y = 0;
h3x = holes_x_offset;                   h3y = holes_y_dist;
h4x = holes_x_dist + holes_x_offset;    h4y = holes_y_dist;

mount_hole_dia = 3.5;
mount_hole_tolerance = 2;
mount_hole_height = 6;

difference(){
    basic_shape();
    mount_holes();
    inner_hole();
}

module basic_shape(shape_height = 2.4){
    shape_dia = 10;
    hull(){
        translate([h1x,h1y,0]) cylinder(d=shape_dia,h=shape_height);
        translate([h2x,h2y,0]) cylinder(d=shape_dia,h=shape_height);
        translate([h3x,h3y,0]) cylinder(d=shape_dia,h=shape_height);
        translate([h4x,h4y,0]) cylinder(d=shape_dia,h=shape_height);
    }
}

module inner_hole(){
    hole_x_scale = 0.8;
    hole_y_scale = 0.8;
    translate([holes_x_dist * (1-hole_x_scale)/2, holes_y_dist * (1-hole_y_scale)/2,0]){
        scale([hole_x_scale,hole_y_scale,1]) basic_shape(4);
    }
}

module mount_holes(){
    translate([h1x,h1y,0]) mount_hole_round();
    translate([h2x,h2y,0]) mount_hole_oval();
    translate([h3x,h3y,0]) mount_hole_round();
    translate([h4x,h4y,0]) mount_hole_oval();
}

module mount_hole_round(){
    cylinder(d=mount_hole_dia,h=mount_hole_height);
}

module mount_hole_oval(){
    hull(){
        translate([-mount_hole_tolerance/2,0,0]) cylinder(d=mount_hole_dia,h=mount_hole_height);
        translate([mount_hole_tolerance/2,0,0]) cylinder(d=mount_hole_dia,h=mount_hole_height);    
    }
}
