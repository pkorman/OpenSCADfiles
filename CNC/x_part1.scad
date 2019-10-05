//$fn=60;
$fa=5;
$fs=.4;

rdist = 110;//44.8; //rod distance

b1d = 29.6; //bearing outer shell

bearingdia = 15.2;
m3screwhole = 3.6;
m4screwhole = 4.2;
m4screwinsert = 5.2;
m4screwInsertHeight = 5;

m5screwhole = 5.2;
m5screwHeadDia = 8.8;
m5screwHeadOffset = 3;

leadScrewOffset = 4;//-1;//4;;

mountHoleDistX = 60;//rdist + b1d + m5screwHeadDia + 0.4;
mountHoleDistY = 60;

total_height = mountHoleDistY + 12 + 2;

p1x = mountHoleDistX + 12; //table base lenght
p1y = 9;//table base width

echo("mountHoleDistX= ",mountHoleDistX);
echo("total_height= ",total_height);
echo("p1x",p1x);

difference(){
    body_all();
    holes();
}

module body_all(){
    linear_extrude(height=total_height){
        translate([0,-b1d/4,0]) square([b1d+rdist,b1d/2],center=true);
        //translate([0,-b1d/2+p1y/2,0]) square([p1x,p1y],center=true);
        square([rdist,b1d],center=true);
        translate([rdist/2,0,0]) circle(d=b1d);
        translate([-rdist/2,0,0]) circle(d=b1d);
    }
}

module holes(){
    linear_extrude(height=100){
        rotate([0,0,45]){
            translate([8,0,0]) circle(d=m3screwhole);
            translate([-8,0,0]) circle(d=m3screwhole);
            translate([0,8,0]) circle(d=m3screwhole);
            translate([0,-8,0]) circle(d=m3screwhole);
        }
        translate([rdist/2,0,0]) circle(d=bearingdia);
        translate([-rdist/2,0,0]) circle(d=bearingdia);
        
        translate([rdist/4,0,0]) hull(){
            translate([rdist/18,0,0]) circle(d=bearingdia);
            translate([-rdist/36,0,0]) circle(d=bearingdia);
        }
        translate([-rdist/4,0,0]) hull(){
            translate([-rdist/18,0,0]) circle(d=bearingdia);
            translate([rdist/36,0,0]) circle(d=bearingdia);
        }

                
        circle(d=9.2);
    }
    translate([0,0,leadScrewOffset]) linear_extrude(height=100){
        circle(d=23.2);
    }
    translate([0,-b1d/2,total_height/2]) rotate([-90,0,0]) holes_for_tool();
}

module mount_hole(x=0,y=0){
    translate([x,y,p1y/2]) linear_extrude(height=m4screwInsertHeight){
        circle(d=m4screwinsert);
    }
    /*translate([x,y,m5screwHeadOffset]) linear_extrude(height=p1y){
        circle(d=m5screwHeadDia);
    }*/
    translate([x,y,0]) linear_extrude(height=p1y+1){
        circle(d=m4screwhole);
    }
}    

module holes_for_tool(){
    mount_hole(mountHoleDistX/2,mountHoleDistY/2);
    mount_hole(-mountHoleDistX/2,mountHoleDistY/2);
    mount_hole(mountHoleDistX/2,-mountHoleDistY/2);
    mount_hole(-mountHoleDistX/2,-mountHoleDistY/2);
}