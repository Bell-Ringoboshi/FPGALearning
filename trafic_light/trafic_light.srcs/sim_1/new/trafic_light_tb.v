`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/25 14:28:13
// Design Name: 
// Module Name: trafic_light_tb
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
`define P 10

module trafic_light_tb( );

    reg clock,reset_N;
    wire[2:0] gyr0,gyr1;

    trafic_light trafic_light(clock,reset_N,gyr0,gyr1);

    initial begin
        clock <= 0;
        #`P
        reset_N <= 1;
        #`P
        reset_N <= 0;
        #`P
        reset_N <= 1;
    end

    always #`P begin
        clock <= ~clock;
    end

endmodule
