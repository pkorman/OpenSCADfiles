//$fn=60;
$fa=5;
$fs=.4;

oScale = .9;

difference(){
    oloid();
    scale([oScale,oScale,oScale]) oloid();
    translate([0,0,-25]) cube(size=50,center=true);
}

module oloid(){
    rotate([0,90,0]) hull(){
        translate([-10,0,0]) start_shape();
        rotate([90,0,0]) translate([10,0,0]) start_shape();
    }
}

module start_shape(){
    linear_extrude(height=1){
        circle(d=40);
    }
}