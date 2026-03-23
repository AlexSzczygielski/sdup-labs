`timescale 1ns / 1ps
module cordic_beh_fixedpoint();
parameter integer FXP_SCALE = 1024;
reg signed [11:0] t_angle = 0.5236 * FXP_SCALE; //Input angle
reg signed [23:0] cos = 1.0 * FXP_SCALE; //Initial condition
reg signed [23:0] sin = 0.0;
reg signed [23:0] angle = 0.0; //Running angle
reg signed [11:0] atan[0:10];
reg signed [11:0] Kn = 0.607253 * FXP_SCALE;
parameter nr_iterat= 11; // number of iterations (max 13)]
reg signed [11:0] sin_out;
reg signed [11:0] cos_out;
reg signed [11:0] angle_deg;
integer i;
reg signed [23:0] tmp;

initial begin //Execute only once
atan[0] = 0.7853981633974483 * FXP_SCALE;
atan[1] = 0.4636476090008061 * FXP_SCALE;
atan[2] = 0.24497866312686414 * FXP_SCALE;
atan[3] = 0.12435499454676144 * FXP_SCALE;
atan[4] = 0.06241880999595735 * FXP_SCALE;
atan[5] = 0.031239833430268277 * FXP_SCALE;
atan[6] = 0.015623728620476831 * FXP_SCALE;
atan[7] = 0.007812341060101111 * FXP_SCALE;
atan[8] = 0.0039062301319669718 * FXP_SCALE;
atan[9] = 0.0019531225164788188 * FXP_SCALE;
atan[10] = 0.0009765621895593195 * FXP_SCALE;


for ( i = 0; i < nr_iterat; i = i + 1) begin // algorithm iterations
if( t_angle > angle ) begin
angle = angle + atan[i];
tmp = cos - ( sin >>> i );
sin = ( cos >>> i ) + sin;
cos = tmp;
end
else begin
angle = angle - atan[i];
tmp = cos + ( sin >>> i );
sin = - ( cos >>> i) + sin;
cos = tmp;
end //if
//Scale sin/cos values
sin_out= (sin * Kn) >>> 10;
cos_out= (cos * Kn) >>> 10;
angle_deg = (angle * 1800) / 31416;
end //for
end //initial
endmodule