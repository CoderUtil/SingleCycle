`timescale 1ns / 1ps

module PCAddIm(
  input [31:0] now_pc, 
  input [31:0] addNum, 
  output [31:0] o_pc
);
  assign o_pc = now_pc  + (addNum * 4); //  ×óÒÆÁ½Î»
endmodule
