proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula05/ex511/ex511.cache/wt [current_project]
  set_property parent.project_path Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula05/ex511/ex511.xpr [current_project]
  set_property ip_repo_paths z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula05/ex511/ex511.cache/ip [current_project]
  set_property ip_output_repo z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula05/ex511/ex511.cache/ip [current_project]
  add_files -quiet Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula05/ex511/ex511.runs/synth_1/e11.dcp
  read_xdc Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula05/ex511/ex511.srcs/constrs_1/imports/Rodrigo/Nexys4_Master.xdc
  link_design -top e11 -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force e11_opt.dcp
  report_drc -file e11_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file e11.hwdef}
  place_design 
  write_checkpoint -force e11_placed.dcp
  report_io -file e11_io_placed.rpt
  report_utilization -file e11_utilization_placed.rpt -pb e11_utilization_placed.pb
  report_control_sets -verbose -file e11_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force e11_routed.dcp
  report_drc -file e11_drc_routed.rpt -pb e11_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file e11_timing_summary_routed.rpt -rpx e11_timing_summary_routed.rpx
  report_power -file e11_power_routed.rpt -pb e11_power_summary_routed.pb
  report_route_status -file e11_route_status.rpt -pb e11_route_status.pb
  report_clock_utilization -file e11_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force e11.mmi }
  write_bitstream -force e11.bit 
  catch { write_sysdef -hwdef e11.hwdef -bitfile e11.bit -meminfo e11.mmi -file e11.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

