use <../sensors_box.scad>
include <../sensors_box.scad>
rotate([90,0,0]){
translate([0,translation+wall_th,-(depth+wall_th+1)]){
    
sensors_box_upper_part();
}}