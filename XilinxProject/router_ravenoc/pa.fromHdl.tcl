
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name router_ravenoc -dir "I:/firsttrojan/router_ravenoc/planAhead_run_1" -part xc7k325tffg900-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "router_ravenoc.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {C:/Users/KRAL/Desktop/ravenoc/src/router/fifo.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top router_ravenoc $srcset
add_files [list {router_ravenoc.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc7k325tffg900-2
