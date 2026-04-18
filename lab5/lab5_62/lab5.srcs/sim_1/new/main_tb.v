`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 14:18:09
// Design Name: 
// Module Name: main_tb
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


module cordic_pipe_rtl_TB;
reg clock, ce, reset, start;
reg [11:0] angle_in;
real angle;
wire [11:0] sin_out, cos_out;
wire [14:0] sign_sin, sign_cos;
wire valid_out;
//For easy output value monitoring
real real_cos, real_sin;
wire [14:0] result_x, result_y;
reg [1:0] state = 0;
real real_x, real_y;
real counter = 0;
real back = 0;
//Instantiation
cordic_pipe_rtl cordic ( clock, reset, ce, angle_in, sin_out, cos_out, valid_out, state, sign_sin, sign_cos );
generator gen (clock, sign_sin, sign_cos, valid_out, result_x, result_y);
//Reset stimuli
initial
begin
 reset <= 1'b1;
 #10 reset <= 1'b0;
end
//ce & clock generator stimuli
initial
begin
 ce <= 1'b1;
 clock <= 1'b1;
end
always
 #5 clock <= ~clock;
//Signals stimuli
initial
 angle = 0.0;
always@(posedge clock)
begin
if(back == 0) begin
     if (angle < 3.14/2 ) angle = angle + 0.1; 
     else begin
        angle = 3.14/2;
        state = state + 1;
        back = 1;
     end
end else begin
     if (angle > 0 ) angle = angle - 0.1; 
     else begin
        angle = 0;
        state = state + 1;
        back = 0;
     end
end
 angle_in <= angle * 1024; //Value in fixed-point (12:10)
 //Convert and display results
 real_cos = cos_out;
 real_sin = sin_out;
 real_cos = real_cos / 1024;
 real_sin = real_sin / 1024;
 real_x = $signed(result_x);
 real_y = $signed(result_y);
 real_x = real_x / 1024;
 real_y = real_y / 1024;
 
 
 $display( "%f,%f", real_x, real_y);
end
endmodule
