//@set_slicing_config(../../slicing/blade.ini)

//@set_modificator(888_4001_modif_cd)
//@set_slicing_config(../../slicing/blade_infill_modif.ini, 888_4001_modif_cd)

//drzak zadniho kolecka
include <../../parameters.scad>
use <../888_4001.scad>

translate([-rotor_blade_depth/2, 3.5, 0])
  888_4001_print(4);

translate([rotor_blade_depth/2, -3.5, 0]) rotate([0, 0, 180])
  888_4001_print(4);

translate([-rotor_blade_depth/2, -12, 0])
  888_4001_print(3);

translate([rotor_blade_depth/2, 12, 0]) rotate([0, 0, 180])
  888_4001_print(3);




module 888_4001_modif_cd(){
  translate([-rotor_blade_depth/2, 3.5, 0])
    888_4001_print_modificator(4);

  translate([rotor_blade_depth/2, -3.5, 0]) rotate([0, 0, 180])
    888_4001_print_modificator(4);

  translate([-rotor_blade_depth/2, -12, 0])
    888_4001_print_modificator(3);

  translate([rotor_blade_depth/2, 12, 0]) rotate([0, 0, 180])
    888_4001_print_modificator(3);


}

%888_4001_modif_cd();
