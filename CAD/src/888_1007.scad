//Spodni cast pylonu
include <../parameters.scad>
use <lib/stdlib/silentblock.scad>

pylon_bottom_wall = 5;

module pylon_silentblocks(){
for(x = [-0.5, 0.5], y=[-0.5, 0.5])
  translate([(pylon_silentblocks_base_distance)*x, (pylon_silentblocks_base_distance)*y, 4])
    silentblock(do=8, l=8, dt=3, l1=5, l2=5);
}
pylon_silentblocks();


module 888_1007(){

 translate([-pylon_silentblocks_base_distance/2-3.5, 0, 0]) rotate([0, -90, 180]) linear_extrude(2+0.5) text(">", halign="center", valign="center");
 translate([pylon_silentblocks_base_distance/2+4, 0, 0]) rotate([90, 0, 90]) linear_extrude(2+0.5) text(week, halign="center", valign="center", size=5);

    difference(){

        minkowski(){
          cube([base_width-11, base_width-11, 8-1], center = true);
          union(){
              cylinder(d1=9, d2 = 11, h=1, $fn=25);
              translate([0, 0, 1]) cylinder(d2=9, d1 = 11, h=1, $fn=25);
          }
        }

        minkowski(){
          difference(){
            cube([base_width - pylon_bottom_wall*2 - 5,
                base_width - pylon_bottom_wall*2 - 7, 11], center = true);

            for(x = [-0.5, 0.5], y=[-0.5, 0.5])
              translate([(pylon_silentblocks_base_distance)*x, (pylon_silentblocks_base_distance)*y, 0])
                cylinder(d = 20, h = 20, center=true);
            }
            cylinder(d=6.3, h=1, $fn=25);
        }

        for(x = [-0.5, 0.5], y=[-0.5, 0.5])
          translate([(pylon_silentblocks_base_distance)*x, (pylon_silentblocks_base_distance)*y, 0]){
            cylinder(d = 10, h = 20, $fn=25);
            //translate([0, 0, -5-0.1]) cylinder(d = M3_nut_diameter, h = 2.5, $fn=6);
            translate([0, 0, -5+2.5+0.1]) cylinder(d = M3_screw_diameter, h = 10, $fn=15);
          }


        //pylon_pipes(pylon_pipe_d, 10, 0);

        for(x = [0,-20, 20])
            translate([x, 0, 0])
                rotate([90, 0, 0]){
                    cylinder(d = M3_screw_diameter, h = base_width+1, center=true, $fn = 24);
                    for(y=[-1, 1]) translate([0, 0, y*(base_width/2-3)])
                        hull(){
                            cylinder(d = M3_nut_diameter, h = M3_nut_height, center=true, $fn = 6);
                            translate([0, 10, 0])
                                cylinder(d = M3_nut_diameter, h = M3_nut_height, center=true, $fn = 6);
                        }
                }
    }
}


//%pylon_pipes();
888_1007();
