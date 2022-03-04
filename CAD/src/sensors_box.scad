$fn=100;
width = 85;
length = 40;
depth = 30;

corner_r = 3;
wall_th = 3;

lid_depth = 0;
lid_width = 0;

M3_screw_diameter=3;

rubber_band_size=2.1;
attach_h=15;

translation = 50; //Oddialovanie casti 

module triangle(x1,y1,z1,x2,y2,z2,x3,y3,z3,h){    
    hull(){
    translate([x1,y1,z1]){
        rotate([0,90,0]){
        cylinder(r=h,h=2*h,center=true);
        }}
    translate([x2,y2,z2]){
        rotate([0,90,0]){
        cylinder(r=h,h=2*h,center=true);
        }}
    translate([x3,y3,z3]){
        rotate([0,90,0]){
        cylinder(r=h,h=2*h,center=true);
        }}
    }
}
module shelf(width,length,depth,wall_th){
x1_1=width/2-wall_th;
y1_1=length-wall_th;
z1_1=0;
x2_1=width/2-wall_th;
y2_1=0;
z2_1=0;
x3_1=width/2-wall_th;
y3_1=0;
z3_1=depth;
h=wall_th/2;
x1_2=-(width/2-wall_th);
y1_2=length-wall_th;
z1_2=0;
x2_2=-(width/2-wall_th);
y2_2=0;
z2_2=0;
x3_2=-(width/2-wall_th);
y3_2=0;
z3_2=depth;
triangle(x1=x1_1,
         y1=y1_1,
         z1=z1_1,
         x2=x2_1,
         y2=y2_1,
         z2=z2_1,
         x3=x3_1,
         y3=y3_1,
         z3=z3_1,h=wall_th/2);
triangle(x1=x1_2,
         y1=y1_2,
         z1=z1_2,
         x2=x2_2,
         y2=y2_2,
         z2=z2_2,
         x3=x3_2,
         y3=y3_2,
         z3=z3_2,h=wall_th/2);
hull(){
    triangle(x1=x1_1,
             y1=y1_1,
             z1=z1_1,
             x2=x1_2,
             y2=y1_2,
             z2=z1_2,
             x3=x2_1,
             y3=y2_1,
             z3=z2_1,h=wall_th/2);
    triangle(x1=x1_1,
             y1=y1_1,
             z1=z1_1,
             x2=x1_2,
             y2=y1_2,
             z2=z1_2,
             x3=x2_2,
             y3=y2_2,
             z3=z2_2,h=wall_th/2);
}

hull(){
    triangle(x1=x2_1,
             y1=y2_1,
             z1=z2_1,
             x2=x3_1,
             y2=y3_1,
             z2=z3_1,
             x3=x2_2,
             y3=y2_2,
             z3=z2_2,h=wall_th/2);
    triangle(x1=x2_1,
             y1=y2_1,
             z1=z2_1,
             x2=x3_1,
             y2=y3_1,
             z2=z3_1,
             x3=x3_2,
             y3=y3_2,
             z3=z3_2,h=wall_th/2);
}
}


module sensors_box_sensor_part(){
difference(){
union(){
shelf(width, length, depth,wall_th);
/*translate([0,-wall_th-translation, depth+wall_th+1]){
    rotate([0,180,0]){
        shelf(width+2*wall_th+1, length+wall_th, depth-wall_th,wall_th);
        }
}*/

}
//hole for ultrasonic sensor
translate([-width/2+13+wall_th, length-17-wall_th,-5]){
cylinder(r=17/2,h=wall_th+5);
}

//hole for lidar

translate([width/2-10-wall_th-34,length-wall_th-16-5,-2]){
cube([34,16,wall_th+5]);
}

//hole for cables
translate([-width/2+wall_th+10+15,-150,wall_th+17]){
//cube([wall_th+2,10,6]);
cube([10,wall_th+500,6]);
}

for(x=[-30,30]) //diery pre sruby
    translate([x,300,attach_h+7/2]){
                rotate([90,0,0]){
                    cylinder(r=M3_screw_diameter/2,h=500); 
            }}
}
}


module sensors_box_upper_part(){
difference(){
union(){

translate([0,-wall_th-translation, depth+wall_th+1]){
    rotate([0,180,0]){
        shelf(width+2*wall_th+1, length+wall_th, depth-wall_th,wall_th);
        }
}

}

//hole for cables
translate([-width/2+wall_th+10+15,-150,wall_th+17]){
//cube([wall_th+2,10,6]);
cube([10,wall_th+500,6]);
}

for(x=[-30,30]) //diery pre sruby
    translate([x,300,attach_h+7/2]){
                rotate([90,0,0]){
                    cylinder(r=M3_screw_diameter/2,h=500); 
            }}
}
}

//sensors_box_upper_part();
//sensors_box_sensor_part();


