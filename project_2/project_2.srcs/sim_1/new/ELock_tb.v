`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/12 13:17:07
// Design Name: 
// Module Name: learning_tb
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

module ELock_tb();

    reg[3:0] num;
    reg rst;
    wire[2:0] state;
    wire lock;

    ELock ELock(num,rst,state,lock);

    initial begin
        #`P
        rst<=1;
        #`P
        rst<=0;
        num<=3;
        #`P
        num<=1;
        #`P
        num<=4;
        #`P
        num<=1;
        #`P
        num<=2;
        #`P
        num<=6;
        #`P
        num<=1;
        #`P
        num<=2;
        #`P
        num<=3;
        #`P
        num<=8;
        #`P
        num<=1;
        #`P
        num<=2;
        #`P
        num<=3;
        #`P
        rst<=1;
        #`P
        rst<=0;
        #`P
        num<=4;
        #`P
        num<=1;
        #`P
        num<=2;
        #`P
        num<=3;
        #`P
        num<=4;
        #`P
        num<=9;
        #`P
        num<=7;
        #`P
        rst<=1;
        #`P
        rst<=0;
        #`P
        $finish;
    end


endmodule
