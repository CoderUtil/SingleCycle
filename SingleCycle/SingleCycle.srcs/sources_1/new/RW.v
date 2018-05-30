`timescale 1ns / 1ps

module RW( 
    input rd,                   // 读使能信号
    input [31:0] addr,          // 存储器地址
    output [31:0] dataOut       // 输出的数据
);

    reg [7:0] rom [99:0]; // 存储器定义必须用reg类型， 存储器存储单元8位长度， 共100个存储单元
    initial       // 加载数据到存储器rom。 注意： 必须使用绝对路径， 如： E:/Xlinx/VivadoProject/ROM/（自己定）
    begin 
        $readmemb ("D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/ROM.txt", rom); // 数据文件rom_data（.coe或.txt） 。 未指定， 就从0地址开始存放。
    end

    assign dataOut[31:24] = rom[addr];
    assign dataOut[23:16] = rom[addr + 1];
    assign dataOut[15:8] = rom[addr + 2];
    assign dataOut[7:0] = rom[addr + 3];
endmodule
