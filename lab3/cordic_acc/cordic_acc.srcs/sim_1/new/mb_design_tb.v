`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 01:55:54
// Design Name: 
// Module Name: mb_design_tb
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


module mb_design_tb();
 reg clk_n, clk_p;
 wire [11:0] angle;
 wire [11:0] sin;
 wire [11:0] cos;
 reg reset, reset_n;

 real r_angle = 1024*3.14*0.2;
 real r_sin, r_cos;
 // Dip switches stimulus
 assign angle = r_angle;
 // Reset stimulus
 initial
 begin
 reset = 1'b1;
 reset_n = 1'b0;
 #10 reset = 1'b0;
 reset_n = 1'b1;
 end
 // Clocks stimulus
 initial
 begin
 clk_n = 1'b0; //set clk to 0
 clk_p = 1'b1;
 end
 always
 begin
 #5 clk_n = ~clk_n; //toggle clk every 5 time units
 clk_p = ~clk_p; //toggle clk every 5 time units
 end
 //Put sin and cos as real values
 always @*
 begin
 r_sin = sin;
 r_cos = cos;
 r_sin = r_sin / 1024;
 r_cos = r_cos / 1024;
 end
 //Instantiate tested module
 mb_design_wrapper mb_design_inst ( clk_n, clk_p, angle, cos, sin, reset, reset_n);
 endmodule

