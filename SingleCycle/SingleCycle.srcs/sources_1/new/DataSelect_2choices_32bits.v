`timescale 1ns / 1ps

module DataSelect_2choices_32bits(
  input [31:0] A, 
  input [31:0] B, 
  input Ctrl, 
  output [31:0] S
);
  
  assign S = (Ctrl == 1'b0 ? A : B);
endmodule
