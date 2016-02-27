# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula2_22Feb2016/ToElearningProjects/Arith_operations/Arith_operations.cache/wt [current_project]
set_property parent.project_path K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula2_22Feb2016/ToElearningProjects/Arith_operations/Arith_operations.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula2_22Feb2016/ToElearningProjects/Arith_operations/Arith_operations.srcs/sources_1/new/Top.vhd
read_xdc K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula2_22Feb2016/ToElearningProjects/Arith_operations/Arith_operations.srcs/constrs_1/imports/Aula1_15Feb2016/Nexys4_Master.xdc
set_property used_in_implementation false [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula2_22Feb2016/ToElearningProjects/Arith_operations/Arith_operations.srcs/constrs_1/imports/Aula1_15Feb2016/Nexys4_Master.xdc]

synth_design -top arith_op -part xc7a100tcsg324-3
write_checkpoint -noxdef arith_op.dcp
catch { report_utilization -file arith_op_utilization_synth.rpt -pb arith_op_utilization_synth.pb }
