//$fn=60;
$fa=5;
$fs=.4;

partHeigh = 8;

offsetX = 24.5;
offsetY = 22.5;

insertDia = 5.4;
insertOutherDia = 10;

difference(){
    hull(){
        translate([0,0,partHeigh-1]) body1();
        body2();
    }
    union(){
        holle1();
        holle2();
    }
}


module body1(){
    linear_extrude(height=1) union(){
        translate([offsetX,offsetY]) rotate([0,0,-41.78]) difference(){
            circle(d=50);
            translate([0,-25/2]) square([50,25],center=true);
        }

        hull(){
            translate([14.5,14.5]) circle(d=33);
            translate([offsetX,offsetY]) rotate([0,0,-41.78]) hull(){
                translate([-57/2,0]) circle(d=insertOutherDia);
                translate([57/2,0]) circle(d=insertOutherDia);
            }
        }
    }
}

module body2(){
    linear_extrude(height=1) union(){
        translate([offsetX,offsetY]) rotate([0,0,-41.78]) difference(){
            circle(d=40);
            translate([0,-25/2]) square([50,25],center=true);
        }

        hull(){
            translate([11,11]) circle(d=22);
            translate([offsetX,offsetY]) rotate([0,0,-41.78]) hull(){
                translate([-57/2,0]) circle(d=insertOutherDia-2);
                translate([57/2,0]) circle(d=insertOutherDia-2);
            }
        }
    }
}

module holle1(){
    translate([0,0,0.2])
    linear_extrude(height=10)
    translate([offsetX,offsetY]) rotate([0,0,-41.78]) union(){
        translate([-57/2,0]) circle(d=insertDia);
        translate([57/2,0]) circle(d=insertDia);
    }
}

module holle2(){
    convertorHeight = 5.5;
    
    translate([0,offsetY-5.5,partHeigh-convertorHeight])
    union(){    
        linear_extrude(height=convertorHeight) square([17,12],center=false);
        
        translate([-2,(12-9)/2,1.5]) 
        linear_extrude(height=convertorHeight-1.5) square([3,9],center=false);
        
        translate([17-3,0,-2])
        linear_extrude(height=2) square([3,12],center=false);
        
        translate([0,(12-9)/2,1]) 
        linear_extrude(height=convertorHeight-1) square([40,9],center=false);
        
        translate([32,12/2,1]) 
        linear_extrude(height=convertorHeight-1) circle(d=27);
        
        /*
        translate([0,(12-9)/2,3]) 
        linear_extrude(height=convertorHeight-2) square([60,4],center=false);
        */
        
    }
    
}


