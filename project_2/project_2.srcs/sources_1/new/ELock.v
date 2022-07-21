`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/12 12:40:38
// Design Name: 
// Module Name: learning
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

module ELock(num,rst,state,lock);

    input[3:0] num;
    input rst;
    output lock;
    output[2:0] state;

    reg[2:0] state;
    reg lock;

    parameter pass1=1;
    parameter pass2=2;
    parameter pass3=3;
    parameter pass4=4;

    always@(num or posedge rst) begin
        if(rst)begin
            state<=0;
            lock<=0;
        end else begin
            case(state) 
                0:state <= num == pass1 ? state+1 : 0;
                1:state <= num == pass2 ? state+1 : 0;
                2:state <= num == pass3 ? state+1 : 0;
                3:state <= num == pass4 ? state+1 : 0;
                4:lock <= 1;
                default: state <= 0;
            endcase
            if(state==4)begin
            lock<=1;
            end
        end        
    end
    
endmodule
