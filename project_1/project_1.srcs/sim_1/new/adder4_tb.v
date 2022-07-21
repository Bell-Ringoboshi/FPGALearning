`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/01 14:01:35
// Design Name: 
// Module Name: adder4_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder4_tb();
reg [3:0] in1, in2;
wire [3:0] rslt ;
wire cy;

adder4 adder4(in1,in2,rslt,cy);



initial begin

    in1 <= 4'b0001;
    in2 <= 4'b0010;
  #10
    in1 <= 4'b0001;
    in2 <= 4'b0000;
  #10
    in1 <= 4'b0110;
    in2 <= 4'b0011;   
  #10
    in1 <= 4'b0111;
    in2 <= 4'b1100;   
  #10
    in1 <= 4'b1111;
    in2 <= 4'b1111;   
  #10
  $finish;
  
 end
  
endmodule
