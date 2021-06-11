//$fn=60;
$fa=5;
$fs=.4;

D_tab = 11.6;
D_pen = 16.8;
wall_thick = 2.4;
tab_ext = 5.6;
part_width = 10;
join_len = 40+2*part_width;


rotate([90,0,0]) main();

//holder();
//joiner();

module main(){
    holder();
    translate([0,0,join_len-part_width]) holder();
    rotate([0,-90,0]) joiner();
}

module joiner(){
    linear_extrude(height=wall_thick/2) square([join_len,tab_ext],center=false);
}

module holder(){
    linear_extrude(height=part_width) union(){
        pen_part();
        table_part();
        back_part();
    }
}

module table_part(){
    mirror([0,1,0]){
        difference(){
            union(){
                square([D_tab/2,D_tab/2],center=false);
                translate([D_tab/2,D_tab/2,0]) circle(d=D_tab+2*wall_thick);
            }
            translate([D_tab/2,D_tab/2,0]) circle(d=D_tab);
            translate([0,D_tab/2,0]) square([D_tab+2*wall_thick,D_tab/2+wall_thick],center=false);
            translate([0,-D_tab/2,0]) square([D_tab+wall_thick,D_tab/2],center=false);
            translate([-wall_thick,0,0]) square([wall_thick,D_tab],center=false);
        }
        translate([D_tab,D_tab/2,0]) square([wall_thick,tab_ext],center=false);
    }
}

module pen_part(){
    difference(){
        union(){
            square([D_pen/2+wall_thick,D_pen/2+wall_thick],center=false);
            translate([D_pen/2+wall_thick,D_pen/2+wall_thick,0]) circle(d=D_pen+2*wall_thick);
        }
        translate([D_pen/2+wall_thick,D_pen/2+wall_thick,0]) circle(d=D_pen);
        translate([0,D_pen/2+wall_thick,0]) square([D_pen+2*wall_thick,D_pen/2+wall_thick],center=false);
    }
}

module back_part(){
    
    difference(){
        translate([-wall_thick/2,-(D_tab/2+tab_ext)*3/2,0]) square([wall_thick/2,(D_pen+2*wall_thick)/2+(D_tab/2+tab_ext)*3/2],center=false);
        translate([-wall_thick/2,0,0]) square([wall_thick/2,tab_ext],center=false);
    }
    
}
