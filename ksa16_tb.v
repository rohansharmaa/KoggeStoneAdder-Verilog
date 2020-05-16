`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2020 20:03:31
// Design Name: 
// Module Name: ksa16_tb
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


module ksa16_tb;
  wire [15:0] sum;
  wire cout;
  reg [15:0] a, b;
  reg cin;
  
  KSA16 ksa16(sum[15:0], cout, a[15:0], b[15:0]);
  
  initial
  begin
    cin=0;
    a=16'b1010000010100000; b=16'b1010000010100000;
    #10 a=16'b0101100011110100; b=16'b1111010011110100;
    #10 a=16'b0000111100111101; b=16'b0000111100001111;
    //#10 a=16'b1100100011001010; b=16'b1100100011001010;
    #10 $stop;
  end
endmodule

