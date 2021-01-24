//$fn=60;
$fa=5;
$fs=.4;

b_width = 52;
b_deep = 38;
b_height1 = 11.6;
b_height2 = 2;
b_round1 = 3;
b_round2 = 2;
height_shift = 2.5;

difference(){
//union(){
    body();
    translate([0,0,height_shift]){
        collet_clamping_nut(b_width/2-13,-b_deep/2+12.6);
        
        left_column = -b_width/2+7.2;
        upper_row = b_deep/2 - 7;
        x_step = 12.6;
        y_step = 12;
        
        collet_chuck(left_column,upper_row);
        collet_chuck(left_column+x_step,upper_row);
        collet_chuck(left_column+2*x_step,upper_row);
        collet_chuck(left_column+3*x_step,upper_row);
        
        collet_chuck(left_column,upper_row-y_step);
        collet_chuck(left_column+x_step,upper_row-y_step);
        
        collet_chuck(left_column,upper_row-2*y_step);
        collet_chuck(left_column+x_step,upper_row-2*y_step);
    }
}





module body(){
    hull(){
        translate([b_width/2-b_round1,b_deep/2-b_round1,0]) cylinder(h=b_height1,r=b_round1);
        translate([b_width/2-b_round1,-b_deep/2+b_round1,0]) cylinder(h=b_height1,r=b_round1);
        translate([-b_width/2+b_round1,b_deep/2-b_round1,0]) cylinder(h=b_height1,r=b_round1);
        translate([-b_width/2+b_round1,-b_deep/2+b_round1,0]) cylinder(h=b_height1,r=b_round1);
    }
    translate([0,0,b_height1]) hull(){
        translate([b_width/2-b_round1,b_deep/2-b_round1,0]) cylinder(h=b_height2,r1=b_round1,r2=b_round2);
        translate([b_width/2-b_round1,-b_deep/2+b_round1,0]) cylinder(h=b_height2,r1=b_round1,r2=b_round2);
        translate([-b_width/2+b_round1,b_deep/2-b_round1,0]) cylinder(h=b_height2,r1=b_round1,r2=b_round2);
        translate([-b_width/2+b_round1,-b_deep/2+b_round1,0]) cylinder(h=b_height2,r1=b_round1,r2=b_round2);
    }
}

module collet_chuck(x=0,y=0){
    translate([x,y,0]){
        cylinder(h=13.5,d1=8.4,d2=11.8);
        translate([0,0,13.5]) cylinder(h=4.4,d1=11.8,d2=9.6);
    }
}

module collet_clamping_nut(x=0,y=0){
    translate([x,y,0]){
        cylinder(h=18,d=10);
        translate([0,0,5.6]) cylinder(h=18-5.6,d=19.6);
    }
}
