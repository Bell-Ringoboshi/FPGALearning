/*function [4:0] opr_gen;
    input [5:0] op;
    input [4:0] operation;
    case (op)
    6'd0: opr_gen = operation;
    6'd1: opr_gen = 5'd0;
    6'd4: opr_gen = 5'd8;
    6'd5: opr_gen = 5'd9;
    6'd6: opr_gen = 5'd10;
    default: opr_gen = 5'h1f;
    endcase
endfunction

function [31:0] alu;
    input [4:0] opr, shift;
    input [31:0] operand1, operand2;
    case (opr)
        5'd0: alu = operand1 + operand2;
        5'd1: alu = operand1 - operand2;
        5'd8: alu = operand1 & operand2;
        5'd9: alu = operand1 | operand2;
        5'd10: alu = operand1 ^ operand2;
        5'd11: alu = ~(operand1 & operand2);
        5'd16: alu = operand1 << shift;
        5'd17: alu = operand1 >> shift;
        5'd18: alu = operand1 >>> shift;
        default: alu = 32'hffffffff;
    endcase
endfunction

function [31:0] calc;
    input [5:0] op;
    input [31:0] alu_result, dpl_imm, dm_r_data, pc;
    case (op)
        6'd0, 6'd1, 6'd4, 6'd5, 6'd6: calc = alu_result;
        6'd3: calc = dpl_imm << 16;
        6'd16: calc = dm_r_data;
        6'd18: calc = {{16{dm_r_data[15]}}, dm_r_data[15:0]};
        6'd20: calc = {{24{dm_r_data[7]}}, dm_r_data[7:0]};
        6'd41: calc = pc+32'd1;
        default: calc = 32'hffffffff;
    endcase
endfunction

function [31:0] npc;
    input [5:0] op;
    input [31:0] reg1, reg2, branch, nonbranch, addr;
    case (op)
        6'd32: npc = (reg1 == reg2)? branch : nonbranch;
        6'd33: npc = (reg1 != reg2)? branch : nonbranch;
        6'd34: npc = (reg1 < reg2)? branch : nonbranch;
        6'd35: npc = (reg1 <= reg2)? branch : nonbranch;
        6'd40, 6'd41: npc = addr;
        6'd42: npc = reg1;
        default: npc = nonbranch;
    endcase
endfunction

function [4:0] wreg;
    input [5:0] op;
    input [4:0] rt, rd;
    case (op)
        6'd0: wreg = rd;
        6'd1, 6'd3, 6'd4, 6'd5, 6'd6, 6'd16, 6'd18, 6'd20: wreg = rt;
        6'd41: wreg = 5'd31;
        default: wreg = 5'd0;
    endcase
endfunction

function [3:0] wrengen;
    input [5:0] op;
    case (op)
    6'd24: wrengen = 4'b0000;
    6'd26: wrengen = 4'b1100;
    6'd28: wrengen = 4'b1110;
    default: wrengen = 4'b1111;
    endcase
endfunction
*/