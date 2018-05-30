`timescale 1ns / 1ps

module ControlUnit(
  input [31:26]op,
  input zero,
  input sign,
  output reg ExtSel,
  output reg PCWre,
  output reg InsMemRW,
  output reg RegDst,
  output reg RegWre,
  output reg [2:0] ALUOp,
  output reg [1:0] PCSrc,
  output reg ALUSrcA,
  output reg ALUSrcB,
  output reg RD,
  output reg WR,
  output reg DBDataSrc
);
  initial 
  begin
    ExtSel = 0;
    PCWre = 1;
    InsMemRW = 1;
    RegDst = 1;
    RegWre = 0;
    ALUOp = 0;
    PCSrc = 0;
    ALUSrcA = 0;
    ALUSrcB = 0;
    RD=0;
    WR = 0;
    DBDataSrc = 0;
  end

  always @(op or zero or sign)
  begin
    case(op)
      //  addi
      6'b000001:    
      begin
        ExtSel = 1;
        PCWre = 1;
        InsMemRW = 0;
        RegDst = 0;
        RegWre = 1;
        ALUOp = 000;
        PCSrc = 00;
        ALUSrcA = 0;
        ALUSrcB = 1;
        RD = 0;
        WR = 0;
        DBDataSrc = 0;
      end
      //  ori
      6'b010000:
      begin
        ExtSel = 0;
        PCWre = 1;
        InsMemRW = 0;
        RegDst = 0;
        RegWre = 1;
        ALUOp = 011;
        PCSrc = 00;
        ALUSrcA = 0;
        ALUSrcB = 1;
        RD = 0;
        WR = 0;
        DBDataSrc = 0;
      end
      //  add
      6'b000000:
      begin
        ExtSel = 1;
        PCWre = 1;
        InsMemRW = 0;
        RegDst = 1;
        RegWre = 1;
        ALUOp = 000;
        PCSrc = 00;
        ALUSrcA = 0;
        ALUSrcB = 0;
        RD = 0;
        WR = 0;
        DBDataSrc = 0;
      end
      //  sub
      6'b000010:
      begin
        ExtSel=2'bx;
        PCWre=1;
        InsMemRW = 0;
        RegDst = 1;
        RegWre = 1;
        ALUOp = 001;
        PCSrc = 00;
        ALUSrcA = 0;
        ALUSrcB = 0;
        RD = 0;
        WR = 0;
        DBDataSrc = 0;     
      end  
      //  and
      6'b010001:
      begin
        ExtSel = 2'bx;
        PCWre = 1;
        InsMemRW = 0;
        RegDst = 1;
        RegWre = 1;
        ALUOp = 100;
        PCSrc = 00;
        ALUSrcA = 0;
        ALUSrcB = 0;
        RD = 0;
        WR = 0;
        DBDataSrc = 0;
      end
      //  or
      6'b010010:
      begin   
        ExtSel = 2'bx;
        PCWre = 1;
        InsMemRW = 0;
        RegDst = 1;
        RegWre = 1;
        ALUOp = 011;
        PCSrc = 00;
        ALUSrcA = 0;
        ALUSrcB = 0;
        RD = 0;
        WR = 0;
        DBDataSrc = 0;
      end   
      //  sll
      6'b011000:
      begin
        ExtSel = 2'bx;
        PCWre = 1;
        InsMemRW = 0;
        RegDst = 0;
        RegWre = 1;
        ALUOp = 010;
        PCSrc = 00;
        ALUSrcA = 1;
        ALUSrcB = 0;
        RD = 0;
        WR = 0;
        DBDataSrc = 0;
      end
      //  bne    
      6'b110001:
      begin
        if(zero == 0)
        begin
          ExtSel = 1;
          PCWre = 1;
          InsMemRW = 0;
          RegDst = 2'bx;
          RegWre = 0;
          ALUOp = 001;
          PCSrc = 01;
          ALUSrcA = 0;
          ALUSrcB = 0;
          RD = 0;
          WR = 0;
          DBDataSrc = 2'bx;
        end 
        else if(zero)
        begin
          ExtSel=1;
          PCWre=1;
          InsMemRW = 0;
          RegDst = 2'bx;
          RegWre = 0;
          ALUOp=001;
          PCSrc = 00;
          ALUSrcA=0;
          ALUSrcB = 0;
          RD=0;
          WR=0;
          DBDataSrc = 2'bx;
        end   
      end   
      //  slti   
      6'b011011:
      begin
        ExtSel=1;
        PCWre=1;
        InsMemRW = 0;
        RegDst = 0;
        RegWre = 1;
        ALUOp=110;
        PCSrc = 00;
        ALUSrcA=0;
        ALUSrcB = 1;
        RD=0;
        WR=0;
        DBDataSrc = 0;
      end        
      //  beq
      6'b110000:
      begin
        if(zero == 0)
        begin 
          PCSrc = 00;
        end
        else if(zero == 1)
        begin
          PCSrc = 01;
        end
        ExtSel=1;
        PCWre=1;
        InsMemRW = 0;
        RegDst = 2'bx;
        RegWre = 0;
        ALUOp=001;
        ALUSrcA=0;
        ALUSrcB = 0;
        RD=0;
        WR=0;
        DBDataSrc = 2'bx;
      end  
      //  sw 
      6'b100110:
      begin
        ExtSel=1;
        PCWre=1;
        InsMemRW = 0;
        RegDst = 2'bx;
        RegWre = 0;
        ALUOp=000;
        PCSrc = 00;
        ALUSrcA=0;
        ALUSrcB = 1;
        RD=0;
        WR=1;
        DBDataSrc = 2'bx;
      end 
      //  lw
      6'b100111:
      begin
        ExtSel=1;
        PCWre=1;
        InsMemRW = 0;
        RegDst = 0;
        RegWre = 1;
        ALUOp=000;
        PCSrc = 00;
        ALUSrcA=0;
        ALUSrcB = 1;
        RD=1;
        WR=0;
        DBDataSrc = 1;
      end  
      //  halt
      6'b111111:
      begin
        ExtSel=0;
        PCWre=0;
        InsMemRW = 0;
        RegDst = 0;
        RegWre = 0;
        ALUOp=000;
        PCSrc = 00;
        ALUSrcA=0;
        ALUSrcB = 0;
        RD=0;
        WR=0;
        DBDataSrc = 0;
      end  
      //  j
      6'b111000:
      begin
        ExtSel=0;
        PCWre=1;
        InsMemRW = 1;
        RegDst = 0;
        RegWre = 0;
        ALUOp=000;
        PCSrc = 10;
        ALUSrcA=0;
        ALUSrcB = 0;
        RD=0;
        WR=0;
        DBDataSrc = 0;
      end 
    endcase    
  end                                                                                                  
endmodule
