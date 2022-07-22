`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/21 15:38:13
// Design Name: 
// Module Name: memory
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


module memory(adrs,data,cs,rd,wr);

    input[9:0] adrs;
    input rd,cs,wr;
    inout[7:0] data;

    wire[9:0] adrs;
    wire rd,cs,wr;
    wire[7:0] data;

    reg [7:0] mem[1023:0];

    assign data = (cs && rd) ? mem[adrs] : 8'hZZ;

    always @(adrs or data or cs or wr) begin
        if(cs && wr) begin
            mem[adrs] <= data;
        end
    end
    
endmodule
