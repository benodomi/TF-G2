//@set_slicing_config(../../slicing/default.ini)

//dil pro pripevneni tazneho motoru
include <../../../parameters.scad>
//use <../../888_2002.scad>
use <../../888_2003.scad>



translate([30, 0, 0])
	translate([0, 75/2 + 95, -110.5])
		rotate([90, 0, 0])
			translate([0, 0, -18/2])
                888_2003();


translate([30, 0, 0])
	translate([0, 75/2 + 95, -110.5])
		rotate([90, 0, 0])
			translate([0, 0, -18/2])
                888_2003();
