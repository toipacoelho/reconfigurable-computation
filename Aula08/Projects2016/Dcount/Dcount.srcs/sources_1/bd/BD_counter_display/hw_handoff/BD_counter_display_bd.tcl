
################################################################
# This is a generated script based on design: BD_counter_display
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source BD_counter_display_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a100tcsg324-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name BD_counter_display

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set an [ create_bd_port -dir O -from 7 -to 0 an ]
  set btnC [ create_bd_port -dir I btnC ]
  set clk [ create_bd_port -dir I clk ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]
  set sw [ create_bd_port -dir I -from 15 -to 0 sw ]

  # Create instance: BinToBCD16_0, and set properties
  set BinToBCD16_0 [ create_bd_cell -type ip -vlnv ua.pt:user:BinToBCD16:1.0 BinToBCD16_0 ]

  # Create instance: DC32_0, and set properties
  set DC32_0 [ create_bd_cell -type ip -vlnv ua.pt:user:DC32:1.0 DC32_0 ]

  # Create instance: TopCounterN_0, and set properties
  set TopCounterN_0 [ create_bd_cell -type ip -vlnv ua.pt:user:TopCounterN:1.0 TopCounterN_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net DC32_0_segments [get_bd_ports seg] [get_bd_pins DC32_0/segments]
  connect_bd_net -net DC32_0_select_display [get_bd_ports an] [get_bd_pins DC32_0/select_display]
  connect_bd_net -net TopCounterN_0_data_out [get_bd_pins DC32_0/data_in] [get_bd_pins TopCounterN_0/data_out]
  connect_bd_net -net btnC_1 [get_bd_ports btnC] [get_bd_pins BinToBCD16_0/reset] [get_bd_pins TopCounterN_0/btnC]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins BinToBCD16_0/clk] [get_bd_pins DC32_0/clk] [get_bd_pins TopCounterN_0/clk]
  connect_bd_net -net sw_1 [get_bd_ports sw] [get_bd_pins BinToBCD16_0/binary]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins BinToBCD16_0/request] [get_bd_pins xlconstant_0/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port btnC -pg 1 -y -110 -defaultsOSRD
preplace port clk -pg 1 -y -130 -defaultsOSRD
preplace portBus sw -pg 1 -y -90 -defaultsOSRD
preplace portBus an -pg 1 -y -200 -defaultsOSRD
preplace portBus seg -pg 1 -y -30 -defaultsOSRD
preplace inst TopCounterN_0 -pg 1 -lvl 1 -y -400 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 2 -y 30 -defaultsOSRD
preplace inst DC32_0 -pg 1 -lvl 5 -y -110 -defaultsOSRD
preplace inst BinToBCD16_0 -pg 1 -lvl 4 -y -100 -defaultsOSRD
preplace netloc btnC_1 1 0 4 -290 -110 N -110 N -110 N
preplace netloc xlconstant_0_dout 1 2 2 20 -70 N
preplace netloc clk_1 1 0 5 -300 -130 N -130 N -130 100 0 350
preplace netloc DC32_0_select_display 1 5 1 660
preplace netloc sw_1 1 0 4 N -90 N -90 N -90 N
preplace netloc DC32_0_segments 1 5 1 660
preplace netloc TopCounterN_0_data_out 1 1 4 NJ -400 NJ -400 NJ -400 340
levelinfo -pg 1 -320 -200 -40 80 240 530 690 -top -520 -bot 230
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""

