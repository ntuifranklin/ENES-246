`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 04:38:15 PM
// Design Name: 
// Module Name: design_sources
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


module design_sources(
    input [5:0] SW,
    output [1:0] LED
    );
    assign LED[0] = ~(SW[0] && SW[1] && SW[2]); //nand gate of 3 input
    assign LED[1] = (SW[3] ^ SW[4] ^ SW[5]);//xor gates of 3 inputs
endmodule
