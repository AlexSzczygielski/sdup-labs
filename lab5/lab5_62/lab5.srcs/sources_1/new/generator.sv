`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 15:24:57
// Design Name: 
// Module Name: generator
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


module generator(input clock, input[11:0] sin, input[11:0] cos, input valid_in, output reg [11:0] result_x, output reg [11:0] result_y);
    reg[14:0] temp1;
    reg[14:0] temp2; 
    always @(posedge clock) begin
        if(valid_in == 1)begin
            temp1 <= (cos << 1) + cos;
            temp2 <= (sin << 3) - sin;
            result_x <= temp1;
            result_y <= temp2;
        end
        else begin
            result_x <= 0;
            result_y <= 0;
        end
    end
endmodule
