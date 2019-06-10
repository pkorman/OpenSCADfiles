//$fn=60;
$fa=5;
$fs=.4;


minkowski(){
    linear_extrude(1) polygon(
            points=[[10,0],[7,7],[0,10],[0,30],[30,0]],
            paths=[[0,1,2,3,4]]);
    sphere(d=2);
}

M = [ [ 1  , 0  , 0  , 0   ],
      [ 0  , 1  , 0.7, 0   ],  // The "0.7" is the skew value; pushed along the y axis
      [ 0  , 0  , 1  , 0   ],
      [ 0  , 0  , 0  , 1   ] ] ;
multmatrix(M) {  union() {
    cylinder(r=10.0,h=10,center=false);
    cube(size=[10,10,10],center=false); 
} }


!linear_extrude(height = 60, twist = 360, slices = 60) {
   difference() {
     offset(r = 10) {
      square(20, center = true);
     }
     offset(r = 8) {
       circle(10, center = true);
     }
   }
 }


cylinder(r1=10,r2=0,h=20);

difference(){
    cylinder(d=30,h=10,$fn=6);
    translate([0,0,-1]) cylinder(d=20,h=12,$fn=5);
}

rotate_extrude(){
translate([10,0,0]){
    polygon(
        points=[[10,0],[0,10],[0,20],[20,0]],
        paths=[[0,1,2,3]]);
    }
}

translate([0, 10, 0]) {

    linear_extrude(10){
        minkowski(){
           square(20,20);
           circle(5);
        }
    }

}

