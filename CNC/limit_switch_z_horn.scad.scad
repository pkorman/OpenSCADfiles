//$fn=60;
$fa=5;
$fs=.4;

m4screwhole = 4.2;

main();

module main(){
    difference(){
        body_all();
        holes();
    }
}

module body_all(){
    linear_extrude(height=3) translate([-18,0,0]) square([36,12]);
    linear_extrude(height=9) translate([-18,12,0]) square([36,11]);
}

module holes(){
    translate([0,6,0.2]) linear_extrude(height=10) hull(){
        translate([0,1,0]) circle(d=m4screwhole);
        translate([0,-1,0]) circle(d=m4screwhole);
    }
}