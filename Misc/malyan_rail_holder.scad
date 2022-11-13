//$fn=60;
$fa=5;
$fs=.4;

insertDiameter = 5.5;
screwDiameter = 3.6;
armThickness = 8;
middleBodyWidth = 42;//20
middleBodyHeight = 8;
baseToMountOffset = 12 + middleBodyHeight;//15
railMountDeep = 12;
railMountHoleOffset = -2;
mountSpanHalf = 63;

union(){
    middlebody();
    chasisMountSet();

    rotate([90,0,0]) union(){
        arm();
        mirror([1,0,0]) arm();
    }
}

module middlebody(){
    translate([0,-railMountDeep/2,0])
    difference(){
        linear_extrude(height=middleBodyHeight) square([middleBodyWidth,railMountDeep],center=true);
        translate([0,railMountHoleOffset,0]) union(){
        linear_extrude(height=5) circle(d=insertDiameter);
        linear_extrude(height=middleBodyHeight+1) circle(d=screwDiameter);
        }
    }
}

module chasisMountSet(){
    translate([0,0,baseToMountOffset])
    union(){
        translate([-mountSpanHalf,0,0]) chasismount();
        translate([mountSpanHalf,0,0]) chasismount();
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
            translate([-middleBodyWidth/2,middleBodyHeight/2]) square([1,middleBodyHeight],center=true);
            translate([-mountSpanHalf,baseToMountOffset]) circle(d=11);
        }
        translate([-mountSpanHalf,baseToMountOffset]) circle(d=insertDiameter);
    }
}


