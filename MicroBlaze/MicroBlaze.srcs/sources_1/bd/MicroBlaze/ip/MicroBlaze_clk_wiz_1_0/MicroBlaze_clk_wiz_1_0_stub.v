// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Aug  8 15:58:13 2022
// Host        : SANADA-Lenovo-TP-X1C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/Rintaro
//               Sanada/verilog/MicroBlaze/MicroBlaze.srcs/sources_1/bd/MicroBlaze/ip/MicroBlaze_clk_wiz_1_0/MicroBlaze_clk_wiz_1_0_stub.v}
// Design      : MicroBlaze_clk_wiz_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module MicroBlaze_clk_wiz_1_0(clk_out1, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,locked,clk_in1" */;
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;
endmodule
