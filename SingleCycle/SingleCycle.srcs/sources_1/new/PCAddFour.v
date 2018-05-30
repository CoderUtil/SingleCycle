`timescale 1ns / 1ps

module PCAddFour(
  input [31:0] i_pc, 
  output [31:0] o_pc
);
  assign o_pc[31:0] = i_pc[31:0] + 4;
endmodule
