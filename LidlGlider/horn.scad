//$fn=60;
$fa=5;
$fs=.4;

print_set();
translate([22,0,0]) print_set();

module print_set(){
    horn();
    translate([0,-8,0]) support();
    //mirror([0,0,1]) support();
}

module horn(){
    difference(){
        union(){
            linear_extrude(height=1.2) hull(){
                    translate([0,5,0]) square([18,0.2]);
                    //translate([23,16,0]) circle(d=6);
                    translate([24,18,0]) circle(d=5);
                    //translate([22,17,0]) circle(d=6);
            }
            linear_extrude(height=1.6){
                square([18,5]);
            }
            
            linear_extrude(height=4){
                translate([0,5,0]) square([18,1]);
            }
        }
        translate([24,18,-5]) cylinder(h=10,d=1);
    }
}

module support(){
    union(){
        linear_extrude(height=0.4){
            square([18,5]);
        }
        linear_extrude(height=3){
            translate([0,5,0]) square([18,1]);
        }
    }
}