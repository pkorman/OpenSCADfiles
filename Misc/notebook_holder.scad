//$fn=60;
$fa=5;
$fs=.4;

D_tab = 11.6;
D_pen = 16.8;
wall_thick = 2.4;
tab_ext = 5.6;
part_width = 10;
join_len = 40+2*part_width;

difference(){
    union(){
        linear_extrude(height=7) part2();
        linear_extrude(height=5.5) part3();
    }
    part1();
}

module part1(){
    translate([-21/2,26+12.4-3]) 
    rotate([-20,0,0]) linear_extrude(height=15) square([21,6],center=true);
}

module part2(){
    part12();

    hull(){
        translate([0,26+12.4]){
            difference(){
                translate([0,0]) circle(d=6);
                translate([-2,-5]) square([10,10],center=true);
            }
        }
        translate([-21+1.5,26+12.4+1.5]) circle(d=3);
    }
    translate([0,26]) square([3,12.4],center=false);
}

module part3(){
    difference(){
        union(){
            translate([-4.5,-5]) circle(d=9);
            translate([-9,-5]) square([9,5]);
        }
        translate([-4.5,-5]) circle(d=5.2);
    }
}

module part12(){
    difference(){
        part11();
        offset(delta=-3) part11();
    }
}

module part11(){
     hull(){
        polygon(points=[[0,0],[0,26],[3,26],[3,21]]);
        translate([-16,5]) circle(d=10);
        translate([-16,21]) circle(d=10);
    }   
}

