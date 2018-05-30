`timescale 1ns / 1ps

module DataSelect_2choices_5bits(
  input [4:0] A, 
  input [4:0] B, 
  input Ctrl, 
  output [4:0] S
);
  assign S = (Ctrl == 1'b0 ? A : B);
endmodule
