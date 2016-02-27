# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Aula02/aula02/aula02.cache/wt [current_project]
set_property parent.project_path Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Aula02/aula02/aula02.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Aula02/aula02/aula02.srcs/sources_1/new/ex21d.vhd
read_xdc Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Nexys4_Master.xdc
set_property used_in_implementation false [get_files Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Nexys4_Master.xdc]

synth_design -top ex21d -part xc7a100tcsg324-1
write_checkpoint -noxdef ex21d.dcp
catch { report_utilization -file ex21d_utilization_synth.rpt -pb ex21d_utilization_synth.pb }
