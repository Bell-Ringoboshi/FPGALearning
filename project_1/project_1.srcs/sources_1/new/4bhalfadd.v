`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/01 13:50:23
// Design Name: 
// Module Name: 4bhalfadd
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


module adder4(in1, in2, out, cy  );
input [3:0] in1, in2;
output [3:0] out;
output cy;

wire [4:0] rslt;

assign rslt = in1 + in2;
assign cy =rslt[4];
assign out = rslt[3:0];

endmodule
