//$fn=60;
$fa=5;
$fs=.4;

total_height = 135;
total_width1 = 88;
total_width2 = 44;
total_deep1 = 7;
total_deep2 = 16;
//mount_hole_y = (total_height - 12) / 2;

m4screwhole = 4.2;
m4screwinsert = 5.2;
m4screwInsertHeight = 5;

mountHole_X_Height = 30;
mountHole_X_DistX = 28;
mountHole_X_DistY = 60;


difference(){
    body_all();
    holes_for_x();
    holes_for_rod_holders();
    holes_for_motor_and_bearing();
    motor_cut(0,-135/2);
    relief_hole(17,-17,23,-23);
    relief_hole(49,27,40,-40);
    relief_hole(-29,-47,40,-40);
}



module body_all(){
     translate([0,total_height/2,0]) rotate([90,0,0]){
        linear_extrude(height=total_height){
            translate([0,total_deep1/2,0]) square([total_width1,total_deep1],center=true);
            translate([0,total_deep2/2,0]) square([total_width2,total_deep2],center=true);
        }
    }
}

module motor_cut(x=0,y=0){
    translate([x,y,0]) linear_extrude(height=total_deep2){
        square([44,10],center=true);
    }
}


module holes_for_rod_holders(){
    mount_hole_for_nut(77/2,50);
    mount_hole_for_nut(77/2-31.5,50);
    mount_hole_for_nut(-77/2,50);
    mount_hole_for_nut(-77/2+31.5,50);
    //
    mount_hole_for_nut(77/2,-50);
    mount_hole_for_nut(77/2-31.5,-50);
    mount_hole_for_nut(-77/2,-50);
    mount_hole_for_nut(-77/2+31.5,-50);
}

module mount_hole_for_nut(x=0,y=0){
    translate([x,y,0]){
        linear_extrude(height=total_deep2){
            square([6,6],center=true);
        }
        translate([0,0,1.2]) linear_extrude(height=total_deep2){
            square([6,10],center=true);
        }
    }
}

module mount_hole_to_x(x=0,y=0){
    translate([x,y,0]) linear_extrude(height=mountHole_X_Height){
        circle(d=m4screwhole);
    }
}    

module holes_for_x(){
    mount_hole_to_x(mountHole_X_DistX/2,mountHole_X_DistY/2);
    mount_hole_to_x(-mountHole_X_DistX/2,mountHole_X_DistY/2);
    mount_hole_to_x(mountHole_X_DistX/2,-mountHole_X_DistY/2);
    mount_hole_to_x(-mountHole_X_DistX/2,-mountHole_X_DistY/2);
}

module insert_hole(x=0,y=0){
    translate([x,y,2]) linear_extrude(height=total_deep2){
        circle(d=m4screwinsert);
    }
    translate([x,y,0]) linear_extrude(height=total_deep2){
        circle(d=m4screwhole);
    }
}   

module holes_for_motor_and_bearing(){
    insert_hole(88/2-10,135/2-5);
    insert_hole(88/2-10,-135/2+5);
    insert_hole(-88/2+10,135/2-5);
    insert_hole(-88/2+10,-135/2+5);
}

module relief_hole(margin_X1=0,margin_X2=0,margin_Y1=0,margin_Y2=0){
    corner_round = 5;
    linear_extrude(height=total_deep2+2) hull(){
        translate([margin_X1-corner_round,margin_Y1-corner_round,-1]) circle(d=2*corner_round);
        translate([margin_X2+corner_round,margin_Y1-corner_round,-1]) circle(d=2*corner_round);
        translate([margin_X1-corner_round,margin_Y2+corner_round,-1]) circle(d=2*corner_round);
        translate([margin_X2+corner_round,margin_Y2+corner_round,-1]) circle(d=2*corner_round);
    }
}