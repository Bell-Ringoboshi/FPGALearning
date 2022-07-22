`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/22 10:05:06
// Design Name: 
// Module Name: memory_tb
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
`define P 1

module memory_tb();

    reg[9:0] adrs;
    reg[7:0] data_i;
    reg rd,cs,wr;

    wire[7:0] data;

    integer i;

    memory memory(adrs,data,cs,rd,wr);

    assign data = (cs && wr) ? data_i : 8'hZZ;

    initial begin
        data_i<=0;
        cs<=1;
        rd<=0;
        wr<=0;
        
        for(i=0;i<=511;i=i+1) begin
            adrs=i;
            wr=1;
            data_i<=i/4;
            #`P;
            wr=0;
        end
        rd=1;
        for(i=0;i<=511;i=i+1) begin
            adrs=i;
            #`P;
        end

        $finish;
    end

endmodule
