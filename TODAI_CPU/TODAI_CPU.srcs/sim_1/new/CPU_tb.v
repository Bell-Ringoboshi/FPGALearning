`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/02 16:37:47
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb( );

reg clk,rstd;

computer computer(clk,rstd);

initial begin
    clk <= 0;
    rstd <= 1;
end

always #(10) begin
    clk <= ~clk;
end

endmodule
