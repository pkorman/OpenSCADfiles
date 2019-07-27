//$fn=60;
$fa=5;
$fs=.4;

translate([0,18,2.5]) rotate([180,0,0]) mount1();
translate([-19.5,25.5,-21.5]) box3();
translate([-19.5,25.5,5]) rotate([180,0,0]) cover();

translate([16,18,-8]) cylinder(d=4,h=16);

module cover(){
    difference(){
        union(){
            linear_extrude(height=2) offset(delta=2.5) box1();
            linear_extrude(height=3.5) offset(delta=-0.4) box1();
            translate([-34/2+10,0,5.25]) cube([8,46-0.8,9],center=true);
        }
        translate([-15.5,0,0]) cylinder(h=8,d=3.6,center=true);
        //translate([-15.5,0,2]) cylinder(h=2,d=8);
        translate([34/2-15,46/2-12.5,1.4]) cylinder(h=4,d=7);
        //translate([34/2-4,46/2-5,1.4]) cylinder(h=4,d=5);
    }
}


module box3(){
    difference(){
        box2();
        translate([19.5,-7.7,13.5]) lock2();
        translate([-15.5,0,22.5]) {
            translate([0,23,0]) cable_hole();
            translate([0,-23,0]) cable_hole();
        }
        translate([-15.5,0,24]){
            cylinder(h=28,d=3.6,center=true);
            rotate([0,0,90]) cylinder(h=15,d=6.2,center=true,$fn=6);
        }
    }

}

module cable_hole(){
    translate([0,0,0.5]) rotate([90,0,0]) hull(){
        cube([3,3,6],center=true);
        translate([0,-2,0]) cylinder(h=6,d=3,center=true);
    }
}

module box2(){
    linear_extrude(height=2.5) box1();
    linear_extrude(height=24){
        difference() {
            offset(delta=2.5) box1();
            box1();
        }
    }
    translate([-14.5,0,10.5]) cube([5,12,21],center=true);
}


module box1(){
    square([34,46],center=true);
}

module mount1(){
    linear_extrude(height=2.5) difference(){
        hull(){
            translate([5.5,0,0]) square(11,center=true);
            translate([20,0,0]) circle(d=11);
        }
        hull(){
            translate([10,0,0]) circle(d=5);
            translate([20,0,0]) circle(d=5);
        }
    }
    lock1();
}

module lock2(){
    linear_extrude(height=10.5) offset(delta=0.2) lock_shape();
}

module lock1(){
    linear_extrude(height=10) lock_shape();
}

module lock_shape(){
    polygon([[0,5.5],[0,-5.5],[-2.5,-8.5],[-2.5,8.5]]);
}
