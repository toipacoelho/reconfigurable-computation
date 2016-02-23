# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a100tcsg324-3
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir I:/SDR_P/1/TestCombProc/TestCombProc.cache/wt [current_project]
set_property parent.project_path I:/SDR_P/1/TestCombProc/TestCombProc.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib I:/SDR_P/1/TestCombProc/TestCombProc.srcs/sources_1/new/Top.vhd
read_xdc C:/SDR_P/1/first/first.srcs/constrs_1/new/SDR_const.xdc
set_property used_in_implementation false [get_files C:/SDR_P/1/first/first.srcs/constrs_1/new/SDR_const.xdc]

catch { write_hwdef -file TestCombProc.hwdef }
synth_design -top TestCombProc -part xc7a100tcsg324-3
write_checkpoint -noxdef TestCombProc.dcp
catch { report_utilization -file TestCombProc_utilization_synth.rpt -pb TestCombProc_utilization_synth.pb }
