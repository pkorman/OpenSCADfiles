//afmetingen uitsparing:
//x,y,z
uitsparing=[8.3,10.0,35.3];
// rand rond de uitsparing
rand=5;
//positie blok links onder vooraan
orig=[0,0,0];
// tussenstuk dikte, verbreding
ts=[15,10];
//helling steun
hel=10;
//afmetingen ruit:
//onder,boven,vertikaal,dikte
ruit=[68,49,69,11];
// afstand tussen boorgaten, diameter en diepte boorgat, diam. kopgat
bg = [26,3,5,6];

translate([3,10,(uitsparing[1])+2]) rotate([-90,0,0]) batt_holder_p0();
rotate([0,-90,0]) translate([0,0,15]) batt_holder_p1();
translate([-45,30,-19]) rotate([90,0,0]) /*translate([0,0,15])*/ batt_holder_p2();

module batt_holder_p0(){
    difference() {
      union() {
        basissteun();
        //tussen();
        //steun();
      }
      boorgaten();
      kopgaten();
    }    
}

module batt_holder_p1() {
    steun3=[uitsparing[0]+rand*2,7+35,uitsparing[2]+rand*2+15];
    vyrez3=-23+(uitsparing[0]+rand*2)/2;    
    
    difference(){
        translate([0,12,-15]) cube(steun3);
        
        translate([vyrez3,19,-10]) cube([46,32,70]);
        translate([vyrez3,19,5]) cube([46,40,70]);
        
        translate([0,19,-15]) cube([uitsparing[0]+rand*2,15,2.5]);
        
        boorgaten();
        kopgaten();
    }
}

module batt_holder_p2(){
    steun3=[uitsparing[0]+rand*2,7+35,uitsparing[2]+rand*2+15];
    vyrez3=-23+(uitsparing[0]+rand*2)/2;    
    
    difference(){
        translate([-26+(uitsparing[0]+rand*2)/2,19,-15]) cube([52,15,20]);
        
        translate([vyrez3,19,-10]) cube([46,32,70]);
        translate([vyrez3,19,5]) cube([46,40,70]);
        translate([0,19,-12.5]) cube([uitsparing[0]+rand*2,15,2.5]);
    }
}

module basissteun() {
    
 steun=[uitsparing[0]+rand*2,uitsparing[1],uitsparing[2]+rand*2];
    steun2=[uitsparing[0]+rand*2,2,uitsparing[2]+rand*2];
    
 uitsppos=[orig[0]+rand,orig[1],orig[2]+rand];
    
//  difference() {   
//    translate(orig) cube(steun);
//    translate(uitsppos) cube(uitsparing);
//  }

  translate(orig) {
    difference(){
        union(){
            cube(steun);
            translate([0,10,0]) cube(steun2);
        }
        
      translate(uitsppos)cube(uitsparing);
    }  
  }

}

module tussen() {
  x=orig[0]-ts[1];
  y=orig[1]+uitsparing[1];
  z=orig[2];
  lv=orig[0];
  rv=orig[0]+(rand*2)+uitsparing[0];
  onderl=x;
  onderr=x+rand*2+ts[1]*2+uitsparing[0];
  bovenl=x;
  bovenr=x+rand*2+ts[1]*2+uitsparing[0];
  
  hoogte=uitsparing[2]+rand*2;
  dik=ts[0];
  points=[
      [lv,y,z], 
      [rv,y,z],
      [lv,y,z+hoogte],
      [rv,y,z+hoogte],
      [onderl,y+dik,z],
      [onderr,y+dik,z],
      [bovenl,y+hel+dik,z+hoogte],
      [bovenr,y+hel+dik,z+hoogte]];
  faces=[
      [0,1,5,4],
      [2,3,1,0],
      [3,7,5,1],
      [7,6,4,5],
      [6,2,0,4],
      [7,3,2,6]];
  polyhedron(points,faces, convexity = 10);
}

module steun() {
  //positie ruit links onder vooraan
  p0=(uitsparing[0]/2)+rand;
  p1=ruit[0]/2;
  //echo(p0, p1);
  ruitpos=[orig[0]+p0-p1,orig[1]+uitsparing[1]+ts[0],orig[2]];
  x=0;
  y=0;
  z=0;
  onderl=x;
  onderr=x+ruit[0];
  bovenl=x-((ruit[1]-ruit[0])/2);
  bovenr=x+((ruit[1]-ruit[0])/2)+ruit[0];
  hoogte=ruit[2];
  dik=ruit[3];
  points=[
      [onderl,y,z], 
      [onderr,y,z],
      [bovenl,y,z+hoogte],
      [bovenr,y,z+hoogte],
      [onderl,y+dik,z],
      [onderr,y+dik,z],
      [bovenl,y+dik,z+hoogte],
      [bovenr,y+dik,z+hoogte]];
  faces=[
      [0,1,5,4],
      [2,3,1,0],
      [3,7,5,1],
      [7,6,4,5],
      [6,2,0,4],
      [7,3,2,6]];
  translate (ruitpos) rotate ([-hel,0,0])
    polyhedron(points,faces, convexity = 10);
}

module boorgaten() {
  tussengaten=bg[0];
  ho = orig[2]+rand+uitsparing[2]/2+tussengaten/2;
  la = orig[2]+rand+uitsparing[2]/2-tussengaten/2;
  xpos = orig[0]+rand+uitsparing[0]/2;
  ypos = orig[1]+uitsparing[1];
  translate([xpos,ypos,la]) {
    rotate([-90,0,0]) {
      cylinder(h=bg[2],r=bg[1], center=false);
    }
  }
  translate([xpos,ypos,ho]) {
    rotate([-90,0,0]) {
      cylinder(h=bg[2],r=bg[1], center=false);
    }
  }
}

module kopgaten() {
  tussengaten=bg[0];
  ho = orig[2]+rand+uitsparing[2]/2+tussengaten/2;
  la = orig[2]+rand+uitsparing[2]/2-tussengaten/2;
  xpos = orig[0]+rand+uitsparing[0]/2;
  ypos = orig[1]+uitsparing[1]+bg[2];
  hog = ts[0]+ruit[3]+hel-bg[2];
  translate([xpos,ypos,la]) {
    rotate([-90,0,0]) {
      cylinder(h=hog,r=bg[3], center=false);
    }
  }
  translate([xpos,ypos,ho]) {
    rotate([-90,0,0]) {
      cylinder(h=hog,r=bg[3], center=false);
    }
  }
}