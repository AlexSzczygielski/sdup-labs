`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11.03.2026 10:59:02
// Design Name:
// Module Name: pwm_driver_tb
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


module pwm_driver_tb(

);
reg CLK;
reg [5:0] SW;
reg [3:0] BTN;
wire [3 : 0] PWM_OUT;
pwm_driver_top driver1(.CLK(CLK), .SW(SW), .BTN(BTN), .PWM_OUT(PWM_OUT));

initial begin
CLK = 0;
SW <= 6'b010001;
BTN <= 4'b0001;
#1000000 BTN <= 4'b0010;
#1500000 SW <= 6'b110010;
#1000000 BTN <= 4'b0100;
#1500000 SW <= 6'b000100;
#1000000 BTN <= 4'b1000;
#1500000 SW <= 6'b101000;
end


always #10 CLK = ~ CLK;

endmodule