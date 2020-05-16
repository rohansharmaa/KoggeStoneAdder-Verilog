`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2020 16:08:07
// Design Name: 
// Module Name: ksa8_tb
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


module ksa8_tb;
  wire [7:0] sum;
  wire cout;
  reg [7:0] a, b;
  reg cin;
  
  KSA8 ksa8(sum[7:0], cout, a[7:0], b[7:0]);
  
  initial
  begin
    cin=0;
    a=8'b10100000; b=8'b10100000;
    #10 a=8'b01011000; b=8'b11110100;
    #10 a=8'b00111101; b=8'b00001111;
   // #10 a=8'b11001010; b=8'b11001000;
   // #10 a=8'b10100110; b=8'b11110100;
   // #10 a=8'b11110011; b=8'b11001100;
   // #10 a=8'b11110011; b=8'b01010111;
    #10 $stop;
  end
endmodule