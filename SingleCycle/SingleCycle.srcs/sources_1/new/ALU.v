`timescale 1ns / 1ps

module ALU(
    input [31:0] rega,
    input [31:0] regb,
    input [2:0] ALUOp,
    output reg[31:0] result,
    output zero,
    output reg sign
);
    integer i;
    assign zero = (rega == regb) ? 1 : 0;
    
    always@ (ALUOp or rega or regb)
    begin
        case(ALUOp)
            //  加
            3'b000: result = rega + regb;
            //  减
            3'b001: result = rega - regb;
            //  左移
            3'b010: result = regb << rega[15:0];
            //  或
            3'b011: result = rega | regb;
            //  与
            3'b100: result = rega & regb;
            //  不带符号比较
            3'b101: result = (rega < regb) ? 1 : 0;
            //  带符号比较
            3'b110: 
            begin 
                if (rega < regb && (( rega[31] == 0 && regb[31] == 0) ||
                (rega[31] == 1 && regb[31] == 1))) 
                    result = 1;
                else if (rega[31] == 0 && regb[31] == 1) result = 0;
                else if (rega[31] == 1 && regb[31] == 0) result = 1;
                else result = 0;
            end
            3'b111: result = rega ^ regb;
    
        endcase
        sign = (result[31] == 0) ? 0 : 1;
    end
endmodule
