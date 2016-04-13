vlib work
vlib msim

vlib msim/blk_mem_gen_v8_3_1
vlib msim/xil_defaultlib
vlib msim/xbip_utils_v3_0_5
vlib msim/c_reg_fd_v12_0_1
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_pipe_v3_0_1
vlib msim/xbip_dsp48_addsub_v3_0_1
vlib msim/xbip_addsub_v3_0_1
vlib msim/c_addsub_v12_0_8

vmap blk_mem_gen_v8_3_1 msim/blk_mem_gen_v8_3_1
vmap xil_defaultlib msim/xil_defaultlib
vmap xbip_utils_v3_0_5 msim/xbip_utils_v3_0_5
vmap c_reg_fd_v12_0_1 msim/c_reg_fd_v12_0_1
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_1 msim/xbip_pipe_v3_0_1
vmap xbip_dsp48_addsub_v3_0_1 msim/xbip_dsp48_addsub_v3_0_1
vmap xbip_addsub_v3_0_1 msim/xbip_addsub_v3_0_1
vmap c_addsub_v12_0_8 msim/c_addsub_v12_0_8

vcom -work blk_mem_gen_v8_3_1 -64 -93 \
"../../../ipstatic/blk_mem_gen_v8_3/simulation/blk_mem_gen_v8_3.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_blk_mem_gen_1_0/sim/design_1_blk_mem_gen_1_0.vhd" \
"../../../bd/design_1/ipshared/ua.pt/hammingweight_v1_0/vhdl/HammingWeight.vhd" \
"../../../bd/design_1/ip/design_1_HammingWeight_0_2/sim/design_1_HammingWeight_0_2.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ipshared/xilinx.com/xlslice_v1_0/xlslice.v" \
"../../../bd/design_1/ip/design_1_xlslice_0_0/sim/design_1_xlslice_0_0.v" \
"../../../bd/design_1/ip/design_1_xlslice_0_1/sim/design_1_xlslice_0_1.v" \
"../../../bd/design_1/ip/design_1_xlslice_0_2/sim/design_1_xlslice_0_2.v" \
"../../../bd/design_1/ip/design_1_xlslice_0_3/sim/design_1_xlslice_0_3.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_HammingWeight_0_3/sim/design_1_HammingWeight_0_3.vhd" \
"../../../bd/design_1/ip/design_1_HammingWeight_0_4/sim/design_1_HammingWeight_0_4.vhd" \
"../../../bd/design_1/ip/design_1_HammingWeight_0_5/sim/design_1_HammingWeight_0_5.vhd" \

vcom -work xbip_utils_v3_0_5 -64 -93 \
"../../../ipstatic/xbip_utils_v3_0/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_1 -64 -93 \
"../../../ipstatic/c_reg_fd_v12_0/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_reg_fd_v12_0/hdl/c_reg_fd_v12_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../ipstatic/xbip_dsp48_wrapper_v3_0/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_1 -64 -93 \
"../../../ipstatic/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_1 -64 -93 \
"../../../ipstatic/xbip_dsp48_addsub_v3_0/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_dsp48_addsub_v3_0/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_addsub_v3_0_1 -64 -93 \
"../../../ipstatic/xbip_addsub_v3_0/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_addsub_v3_0/hdl/xbip_addsub_v3_0.vhd" \

vcom -work c_addsub_v12_0_8 -64 -93 \
"../../../ipstatic/c_addsub_v12_0/hdl/c_addsub_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_addsub_v12_0/hdl/c_addsub_v12_0.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_c_addsub_0_0/sim/design_1_c_addsub_0_0.vhd" \
"../../../bd/design_1/ip/design_1_c_addsub_0_1/sim/design_1_c_addsub_0_1.vhd" \
"../../../bd/design_1/ip/design_1_c_addsub_0_2/sim/design_1_c_addsub_0_2.vhd" \
"../../../bd/design_1/ipshared/ua.pt/eightdisplaycontrol_v1_0/segment_decoder.vhd" \
"../../../bd/design_1/ipshared/ua.pt/eightdisplaycontrol_v1_0/disp.vhd" \
"../../../bd/design_1/ip/design_1_EightDisplayControl_0_0/sim/design_1_EightDisplayControl_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ip/design_1_xlslice_0_4/sim/design_1_xlslice_0_4.v" \
"../../../bd/design_1/ip/design_1_xlslice_0_5/sim/design_1_xlslice_0_5.v" \
"../../../bd/design_1/ipshared/xilinx.com/xlconstant_v1_1/xlconstant.v" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/hdl/design_1.v" \

vlog -work xil_defaultlib "glbl.v"
