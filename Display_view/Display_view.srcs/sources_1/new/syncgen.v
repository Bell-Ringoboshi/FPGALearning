//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/26 15:35:42
// Design Name: 
// Module Name: syncgen
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


module syncgen(
    input CLK,
    input RST,
    output PCK,
    output reg VGA_HS,
    output reg VGA_VS,
    output reg[9:0] HCNT,
    output reg[9:0] VCNT
    );
    
    `include "vga_param.vh"

    pckgen pckgen(.SYSCLK(CLK),.PCK(PCK));

    wire hcntend = (HCNT==HPERIOD-10'h001);

    always @(posedge PCK)begin
        if(RST)HCNT<=0;
        else if(hcntend)HCNT<=0;
        else HCNT<=HCNT+1;

    end

    always @(posedge PCK)begin
        if(RST)VCNT<=1;
        else if(hcntend)begin
            if(VCNT==VPERIOD-1)VCNT<=0;
            else VCNT<=VCNT+1;
        end
    end

    wire[9:0] hsstart = HFRONT - 1;
    wire[9:0] hsend = HFRONT + HWIDTH - 1;
    wire[9:0] vsstart = VFRONT;
    wire[9:0] vsend = VFRONT + VWIDTH;
    
    always @(posedge PCK)begin
        if(RST) VGA_HS<=1;
        else if(HCNT==hsstart) VGA_HS<=0;
        else if(HCNT==hsend) VGA_HS<=1;
    end

    always @(posedge PCK)begin
        if(RST) VGA_VS<=1;
        else if(HCNT==hsstart)begin
            if(VCNT==hsstart) VGA_VS<=0;
            else if(VCNT==vsend) VGA_VS<=1;
        end

    end


endmodule
