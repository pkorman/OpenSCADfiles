

hole_cut_height = 20;
main_part_height = 5;

difference() {
    hull(){
        cylinder(d=21,h=main_part_height);
        translate([9,0,0]) cylinder(d=14,h=main_part_height);
        translate([2.5,0,25]) sphere(d=20);
    }

    translate([12,0,-5]) {
        hull() { //cable hole
            translate([0,2,0]) cylinder(d=3,h=hole_cut_height);
            translate([0,-2,0]) cylinder(d=3,h=hole_cut_height);
        }
    }
    
    translate([0,0,-5]) cylinder(d=5,h=11); //motor shaft hole
    translate([0,7.5,-5]) cylinder(d=2,h=hole_cut_height); //motor mount hole
    translate([0,-7.5,-5]) cylinder(d=2,h=hole_cut_height); //motor mount hole
    
    translate([10.5,-15,5]) cube([30,30,50]); //bottom cut
    translate([-6.5,16,35]) cube([30,30,60],center=true); //side cut
    translate([-6.5,-16,35]) cube([30,30,60],center=true); //side cut
    
}