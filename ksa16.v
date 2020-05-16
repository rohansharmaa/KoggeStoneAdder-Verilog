`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2020 19:50:28
// Design Name: 
// Module Name: ksa16
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


module ksa16(output [15:0] sum, output cout, input [15:0] a, b);
  
  wire cin = 1'b0;
  wire [15:0] c;
  wire [15:0] g, p;
  Square sq[15:0](g, p, a, b);

  // first line of circles
  wire [15:1] g2, p2;
  SmallCircle sc0_0(c[0], g[0]);
  BigCircle bc0[15:1](g2[15:1], p2[15:1], g[15:1], p[15:1], g[14:0], p[14:0]);
  
  // second line of circle
  wire [15:3] g3, p3;
  SmallCircle sc1[2:1](c[2:1], g2[2:1]);
  BigCircle bc1[15:3](g3[15:3], p3[15:3], g2[15:3], p2[15:3], g2[13:1], p2[13:1]);
  
  // third line of circle
  wire [15:7] g4, p4;
  SmallCircle sc2[6:3](c[6:3], g3[6:3]);
  BigCircle bc2[15:7](g4[15:7], p4[15:7], g3[15:7], p3[15:7], g3[11:3], p3[11:3]);

  // fourth line of circle
  wire [15:15] g5, p5;
  SmallCircle sc3[14:7](c[14:7], g4[14:7]);
  BigCircle bc3_15(g5[15], p5[15], g4[15], p4[15], g4[7], p4[7]);  
  
  // fifth line of circle
  SmallCircle sc4_15(c[15], g5[15]);
  
  // last line - triangles
  Triangle tr0(sum[0], p[0], cin);
  Triangle tr[15:1](sum[15:1], p[15:1], c[14:0]);

  // generate cout
  buf  (cout, c[15]);

endmodule