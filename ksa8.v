`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2020 16:05:00
// Design Name: 
// Module Name: ksa8
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

module BigCircle(output G, P, input Gi, Pi, GiPrev, PiPrev);
  
  wire e;
  and  (e, Pi, GiPrev);
  or  (G, e, Gi);
  and  (P, Pi, PiPrev);
  
endmodule

module SmallCircle(output Ci, input Gi);
  
  buf  (Ci, Gi);
  
endmodule

module Square(output G, P, input Ai, Bi);
  
  and  (G, Ai, Bi);
  xor  (P, Ai, Bi);
  
endmodule

module Triangle(output Si, input Pi, CiPrev);
  
  xor  (Si, Pi, CiPrev);
  
endmodule
module ksa8(output [7:0] sum, output cout, input [7:0] a, b);
  
  wire cin = 1'b0;
  wire [7:0] c;
  wire [7:0] g, p;
  Square sq[7:0](g, p, a, b);

  // first line of circles
  wire [7:1] g2, p2;
  SmallCircle sc0_0(c[0], g[0]);
  BigCircle bc0[7:1](g2[7:1], p2[7:1], g[7:1], p[7:1], g[6:0], p[6:0]);
  
  // second line of circle
  wire [7:3] g3, p3;
  SmallCircle sc1[2:1](c[2:1], g2[2:1]);
  BigCircle bc1[7:3](g3[7:3], p3[7:3], g2[7:3], p2[7:3], g2[5:1], p2[5:1]);
    
  // third line of circle
  wire [7:7] g4, p4;
  SmallCircle sc2[6:3](c[6:3], g3[6:3]);
  BigCircle bc2_7(g4[7], p4[7], g3[7], p3[7], g3[3], p3[3]);

  // fourth line of circle
  SmallCircle sc3_7(c[7], g4[7]);

  // last line - triangles
  Triangle tr0(sum[0], p[0], cin);
  Triangle tr[7:1](sum[7:1], p[7:1], c[6:0]);
  
  // generate cout
  buf  (cout, c[7]);
  
endmodule
