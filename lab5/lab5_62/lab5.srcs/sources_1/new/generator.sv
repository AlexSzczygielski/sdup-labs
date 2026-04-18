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


module generator(input clock, input[14:0] sin, input[14:0] cos, input valid_in, output reg [14:0] result_x, output reg [14:0] result_y);
    always @(posedge clock) begin
        if(valid_in == 1)begin
            result_x <= (cos << 1) + cos;
            result_y <= (sin << 3) - sin;
        end
        else begin
            result_x <= 0;
            result_y <= 0;
        end
    end
endmodule
