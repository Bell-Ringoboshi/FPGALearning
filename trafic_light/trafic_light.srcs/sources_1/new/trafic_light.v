`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/25 11:47:45
// Design Name: 
// Module Name: trafic_light
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

`define RR0 3'b000
`define RG  3'b001
`define RY  3'b010
`define RR1 3'b100
`define GR  3'b101
`define YR  3'b110

`define RR_time 1
`define G_time  5
`define Y_time  2

module trafic_light(clock,reset_N,gyr1,gyr0);

    input clock;
    input reset_N;
    output[2:0] gyr1,gyr0;

    reg[2:0] state;
    reg[3:0] t_count;

    assign gyr0 = (state==`RG) ? 3'b100 : (state==`RY) ? 3'b010 : 3'b001;
    assign gyr1 = (state==`GR) ? 3'b100 : (state==`YR) ? 3'b010 : 3'b001;

    task wait_transition;
        input[3:0] time_count;
        input[2:0] next_state;

        begin
            if(t_count==0)begin
                state <= next_state;
                t_count <= time_count;
            end else begin
                t_count <= t_count - 1;
            end
        end
    endtask

    always @(posedge clock or negedge reset_N) begin
        if(!reset_N)begin
            state <= `RR0;
            t_count <= `RR_time;
        end else if(state==`RR0)begin
            wait_transition(`G_time,`RG);
        end else if(state==`RG)begin
            wait_transition(`Y_time,`RY);
        end else if(state==`RY)begin
            wait_transition(`RR_time,`RR1);
        end else if(state==`RR1)begin
            wait_transition(`G_time,`GR);
        end else if(state==`GR)begin
            wait_transition(`Y_time,`YR);
        end else if(state==`YR)begin
            wait_transition(`RR_time,`RR0);
        end
        
    end

endmodule
