//$fn=60;
$fa=5;
$fs=.4;

insertDiameter = 5.5;
screwDiameter = 3.5;
armThickness = 4;
middleBodyHeight = 8;
baseToMountOffset = 15 + middleBodyHeight;

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
        linear_extrude(height=middleBodyHeight) square([20,12],center=true);
        linear_extrude(height=5) circle(d=insertDiameter);
        linear_extrude(height=middleBodyHeight+1) circle(d=screwDiameter);
    }
}

module chasisMountSet(){
    translate([0,0,baseToMountOffset])
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
            translate([-10,middleBodyHeight/2]) square([1,middleBodyHeight],center=true);
            translate([-63,baseToMountOffset]) circle(d=11);
        }
        translate([-63,baseToMountOffset]) circle(d=insertDiameter);
    }
}


