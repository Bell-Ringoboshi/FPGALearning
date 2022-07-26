module computer (clk, rstd); 
    input clk, rstd;
    wire [31:0] pc, ins, reg1,reg2, result, nextpc; 
    wire [4:0] wra; 
    wire [3:0] wren;

    fetch fetch_body (pc[7:0], ins); 
    execute execute_body (clk, ins, pc, reg1, reg2, wra, result, nextpc); 
    writeback writeback_body (clk, rstd, nextpc, pc); 
    reg_file rf_body (clk, rstd, result, ins [25:21] , ins [20:16] , wra, (~| wra) , reg1, reg2); 
endmodule