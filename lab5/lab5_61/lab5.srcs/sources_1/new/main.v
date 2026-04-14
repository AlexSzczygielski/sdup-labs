`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 14:15:39
// Design Name: 
// Module Name: main
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

//////////////////////////////////////////////////////////////////////////////////
// Design Name: Pipeline cordic custom processor
// Module Name: cordic_step
// Define the cordic step in blocks a2 - a13
//////////////////////////////////////////////////////////////////////////////////
module cordic_step ( clock, ce, sin_in, cos_in, angle_in, t_angle, atan,
 sin_out, cos_out, angle_out, t_angle_out );
parameter integer step = 0; //Step number
parameter integer W = 12; //Width for fixed-point representation. Fixpoint(12:10)
input clock, ce;
input signed [W-1:0] sin_in, cos_in, angle_in, t_angle, atan;
output reg signed [W-1:0] sin_out, cos_out, angle_out, t_angle_out;
//
always @ (posedge clock)
begin
 if( ce == 1'b1 )
 begin
 if(t_angle > angle_in)
 begin
 cos_out <= cos_in - (sin_in >>> step); //Arithmetic shift !!!
 sin_out <= (cos_in >>> step) + sin_in;
 angle_out <= angle_in + atan;
 end
 else
 begin
 cos_out <= cos_in + (sin_in >>> step);
 sin_out <= -(cos_in >>> step) + sin_in;
 angle_out <= angle_in - atan;
 end
 t_angle_out <= t_angle;
 end //if ( ce == 1'b1 )
end
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Design Name: Pipeline cordic custom processor
// Module Name: mul_Kn
// Define the multiplication by constant Kn in blocks a14 - a18.
//////////////////////////////////////////////////////////////////////////////////
module mul_Kn(clock, ce, value_in, value_out);
parameter integer W = 12; //Width of the fixed-point (12:10) representation
parameter FXP_SHIFT = 10; //Fraction for fixed-point (12:10) representation
input clock, ce;
input signed[W-1:0] value_in;
output reg signed[W-1:0] value_out;
reg signed [2*W-1:0] val, val_0, val_2, val_4, val_5, val_7, val_7_9_d, val_9; //Shifted input values
reg signed [2*W-1:0] val_0_2, val_4_5, val_7_9, val_0_2_4_5, val_0_2_4_5_7_9; //Accumulated values
//
always @ (posedge clock)
begin
 if( ce == 1'b1 )
 begin
 //Step S4
 val = value_in; val_0 <= val; val_2 <= val << 2; val_4 <= val << 4;
 val_5 <= val << 5; val_7 <= val << 7; val_9 <= val << 9;
 //Step S5
 val_0_2 <= val_0 - val_2; val_4_5 <= val_4 - val_5; val_7_9 <= val_7 + val_9;
 //Step S6
 val_0_2_4_5 <= val_0_2 + val_4_5;
 val_7_9_d <= val_7_9; //delay val_7_9 which is necessary in the 4-th pipe stage
 //Step S7
 val_0_2_4_5_7_9 = val_0_2_4_5 + val_7_9_d;
 //Step S8
 value_out <= val_0_2_4_5_7_9 >>> FXP_SHIFT;
 end
end
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Design Name: The pipelined custom processor for cordic algorithm
// Module Name: cordic_pipe_rtl
//////////////////////////////////////////////////////////////////////////////////
module cordic_pipe_rtl( clock, reset, ce, angle_in, sin_out, cos_out, valid_out );
parameter integer W = 12; //Width of the fixed-point (12:10) representation
parameter FXP_MUL = 1024; //Scaling factor for fixed-point (12:10) representation
parameter PIPE_LATENCY = 15; // Input->output delay in clock cycles
input clock, reset, ce;
input [W-1:0] angle_in; //Angle in radians
output [W-1:0] sin_out, cos_out;
output valid_out; //Valid data output flag
//Cordic look-up table
reg signed [11:0] atan[0:10] = { 12'b001100100100, 12'b000111011011, 12'b000011111011, 12'b000001111111,
 12'b000001000000, 12'b000000100000, 12'b000000010000, 12'b000000001000,
12'b000000000100, 12'b000000000010, 12'b000000000001 };
//Tabs of wires for connections between the stage processors a2 - a13
wire signed [W-1:0] sin_tab [0:11];
wire signed [W-1:0] cos_tab [0:11];
wire signed [W-1:0] t_angle_tab [0:11]; //Target angle also must be pipelined
wire signed [W-1:0] angle_tab [0:11];
//
reg unsigned [4:0] valid_cnt; //Counts pipeline delay
//Synchroniuos activity: latency counter, angle_in latch
always@(posedge clock)
begin
 if ( reset == 1'b1 )
 valid_cnt <= PIPE_LATENCY; //Setup latency counter
 else
 if( ( valid_cnt != 0 ) && ( ce == 1'b1 ) )
 valid_cnt <= valid_cnt - 1; //Valid output data moves toward output
end
assign valid_out = ( valid_cnt == 0 )? 1'b1 : 1'b0; //Set valid_out when counter counts up to PIPE_LATENCY
//Stage a1: assign initial values (No registers - asynchronous !!!)
assign cos_tab[0] = 1.0 * FXP_MUL;
assign sin_tab[0] = 0;
assign angle_tab[0] = 0;
assign t_angle_tab[0] = angle_in;
//Stage a2 - 13 processor netlist
 parameter N = 11;
 genvar j;
generate for (j=0; j<N; j=j+1)
begin:  cordic_generate
 cordic_step #(j) cordic_step ( clock, ce, sin_tab[j], cos_tab[j], angle_tab[j], t_angle_tab[j], atan[j],
 sin_tab[j+1], cos_tab[j+1], angle_tab[j+1], t_angle_tab[j+1] );
end //end of the for loop inside the generate block
endgenerate //end of the generate block

//Stage a14 - 18: scaling of the results
 mul_Kn mul_Kn_sin ( clock, ce, sin_tab[11], sin_out );
 mul_Kn mul_Kn_cos ( clock, ce, cos_tab[11], cos_out );
endmodule