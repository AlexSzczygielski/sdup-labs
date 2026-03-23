`timescale 1ns / 1ps
module cordic_beh_fixedpoint();
parameter integer FXP_SCALE = 1024;
reg signed [11:0] t_angle = 0.8 * FXP_SCALE; //Input angle
reg signed [11:0] cos = 1.0 * FXP_SCALE; //Initial condition
reg signed [11:0] sin = 0.0;
reg signed [11:0] angle = 0.0; //Running angle
reg signed [11:0] atan[0:10] = { 0.7853981633974483 * FXP_SCALE, 0.4636476090008061 * FXP_SCALE, 0.24497866312686414 * FXP_SCALE,
0.12435499454676144 * FXP_SCALE, 0.06241880999595735 * FXP_SCALE, 0.031239833430268277 * FXP_SCALE, 0.015623728620476831 * FXP_SCALE,
0.007812341060101111 * FXP_SCALE, 0.0039062301319669718 * FXP_SCALE, 0.0019531225164788188 * FXP_SCALE, 0.0009765621895593195 * FXP_SCALE};
reg signed [11:0] Kn = 0.607253 * FXP_SCALE;
parameter nr_iterat= 12; // number of iterations (max 13)]
integer i;
reg signed tmp[11:0];
initial begin //Execute only once
for ( i = 0; i < nr_iterat; i = i + 1) begin // algorithm iterations
if( t_angle > angle ) begin
angle = angle + atan[i];
tmp = cos - ( sin / 2**i );
sin = ( cos / 2**i ) + sin;
cos = tmp;
end
else begin
angle = angle - atan[i];
tmp = cos + ( sin / 2**i );
sin = - ( cos / 2**i) + sin;
cos = tmp;
end //if
//Scale sin/cos values
sin_out= sin * Kn[i];
cos_out= cos * Kn[i];
angle_deg= angle * 180 / 3.14159265359;
#10
$display("i=%02d, angle=%f [deg], sin=%f, cos=%f, cos_error=%f",
 i, angle_deg, sin_out,cos_out, (cos_out-t_cos));
end //for
end //initial
endmodule