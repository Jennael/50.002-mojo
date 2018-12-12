set projDir "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/planAhead"
set projName "new mojo game(enna) v3"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/mojo_top_0.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/reset_conditioner_1.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/simple_ram_2.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/simple_ram_2.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/input_capture_4.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/multi_seven_seg_5.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/displaymorse_6.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/settings_7.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/buttonmapping_8.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/counter_9.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/seven_seg_10.v" "D:/Grand/SUTD/Term 4 (ISTD)/50.002/1D/Mojo test/new mojo game(enna) v3/work/verilog/decoder_11.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/Grand/SUTD/Term\ 4\ (ISTD)/50.002/1D/Mojo\ test/new\ mojo\ game(enna)\ v3/constraint/ports.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
