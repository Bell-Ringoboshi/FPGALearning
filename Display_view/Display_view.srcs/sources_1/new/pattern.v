

module pattern(
    input CLK,
    input RST,
    output reg[7:0] VGA_R,VGA_G,VGA_B,
    output VGA_HS,VGA_VS,
    output reg VGA_DE,
    output PCK
);

    `include "vga_param.vh"

    localparam HSIZE = 64;
    localparam VSIZE = 120;

    wire[9:0] HCNT,VCNT;

    syncgen syncgen(
        .CLK(CLK),
        .RST(RST),
        .PCK(PCK),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        
        .HCNT(HCNT),
        .VCNT(VCNT)
    );

    wire[9:0] HBLANK = HFRONT + HWIDTH + HBACK;
    wire[9:0] VBLANK = VFRONT + VWIDTH + VBACK;
    wire[9:0] CCNT = HCNT - HBLANK + 1;
    wire[3:0] INDCNT = CCNT[5:2];
    
    wire disp_enable = (VBLANK <= VCNT) && (HBLANK - 10'd1 <= HCNT) && (HCNT < HPERIOD - 10'd1);

    wire[2:0] rgb_0 = 7 - ((VCNT - VBLANK + 1) / VSIZE) - ((2 * (((VCNT - VBLANK + 1) / VSIZE) >=1)) + (((VCNT - VBLANK + 1) / VSIZE) >=2));
    wire[2:0] rgb_1 = rgb_0;

    always @(posedge PCK)begin
        if(RST)begin
            {VGA_R,VGA_G,VGA_B} <= 0;
        end
        else if(disp_enable) begin
            VGA_R <= rgb_1[2] ? {INDCNT,INDCNT}:0; 
            VGA_G <= rgb_1[1] ? {INDCNT,INDCNT}:0; 
            VGA_B <= rgb_1[0] ? {INDCNT,INDCNT}:0; 
        end
        else {VGA_R,VGA_G,VGA_B} <= 0;
    end

    always @(posedge PCK)begin
        if(RST) VGA_DE <= 0;
        else VGA_DE <= disp_enable;
    end

endmodule

