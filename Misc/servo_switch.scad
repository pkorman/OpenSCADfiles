module diera(sx,sy) {
    translate([sx,sy,0]) cylinder(h=20,d=3,center=true,$fn=40);
}

module diery() {
    diera(6,0);
    diera(6,28);
    diera(-5,0);
    diera(-17,16);
}

module zakladna() {
    translate([-20,-3,-2]) cube([32,34,2]);
    translate([0,-3,-8.5]) cube([12,5.7,8.5]);
    translate([0,25.3,-8.5]) cube([12,5.7,8.5]);
}

module vyrez() {
    translate([0,2.2,-10]) cube([14,23.6,20]);
}

//rotate([0,180,0]) 
difference() {
    zakladna();
    diery();
    vyrez();
}