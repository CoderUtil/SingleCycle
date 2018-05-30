`timescale 1ns / 1ps

module DataSelect_3choices_32bits(
  input [31:0] A, 
  input [31:0] B,
  input [31:0] C, 
  input [1:0] Ctrl, 
  output reg [31:0] S
);
  always@(Ctrl or A or B or C)
  begin
    case(Ctrl)
    2'b00:
    begin
      S <= A;
    end
    2'b01:
    begin
      S <= B;
    end
    2'b10:
    begin
      S <= C;
    end
    endcase
  end
endmodule
