//$fn=60;
$fa=5;
$fs=.4;

insertDiameter = 5.5;
screwDiameter = 3.5;
armThickness = 4;

union(){
    middlebody();
    chasisMountSet();

    rotate([90,0,0]) union(){
        arm();
        mirror([1,0,0]) arm();
    }
}

module middlebody(){
    translate([0,-6,0])
    difference(){
        linear_extrude(height=8) square([20,12],center=true);
        linear_extrude(height=5) circle(d=insertDiameter);
        linear_extrude(height=8) circle(d=screwDiameter);
    }
}

module chasisMountSet(){
    translate([0,0,25])
    union(){
        translate([-63,0,0]) chasismount();
        translate([63,0,0]) chasismount();
    }   
}

module chasismount(){
    translate([0,-4,0])
    rotate([-90,0,0])
    translate([0,0,-4])
    difference(){
        linear_extrude(height=8) circle(d=11);
        linear_extrude(height=5) circle(d=insertDiameter);
        linear_extrude(height=8) circle(d=screwDiameter);
    }
}

module arm(){
    linear_extrude(height=armThickness)
    difference(){
        hull(){
            translate([-10,4]) square([1,8],center=true);
            translate([-63,25]) circle(d=11);
        }
        translate([-63,25]) circle(d=insertDiameter);
    }
}


