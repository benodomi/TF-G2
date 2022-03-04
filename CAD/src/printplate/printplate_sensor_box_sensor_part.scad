use <../sensors_box.scad>
include <../sensors_box3.scad>
translate([0,wall_th/2,wall_th/2]){
    rotate([90,0,0])
sensors_box_sensor_part();
}