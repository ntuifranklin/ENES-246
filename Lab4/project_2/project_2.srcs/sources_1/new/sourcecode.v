`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2019 01:47:11 PM
// Design Name: 
// Module Name: sourcecode
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


module sourcecode(
    input [5:0] SW,
    output [3:0] LED
    );
    wire w01,w0112,w12,w12_1;
    wire w34,w3445,w45,w45_1;
    //First circuit
    and a1(w01,(!SW[0]),(!SW[1]));
    nor no1(w12,(!SW[1]),(!SW[2]));
    nand n1(w12_1,SW[1], SW[2]);
    or o2(w0112,w01,w12);
    assign LED[0] = !w0112;
    assign LED[1] = w12_1 ;
    //Second circuit
    and a2(w34,(!SW[3]),(!SW[4]));
    or o3(w45,(!SW[4]),(!SW[5]));
    and a3(w45_1,(SW[4]),(SW[5]));
    or o4(w3445,w34,(!w45));
    assign LED[2] = !w3445 ;
    assign LED[3] = !w45_1 ;
endmodule


/*

module vcb(
   input  [15:0] SW,
   //input  sw1,
   output [15:0] LED
   );
   wire nand1;
   and a1(LED[0],SW[0],SW[1]);
   bufif1 b1(LED[1], SW[0],SW[1]);
   nand n1(nand1,SW[0],SW[1]);
   nand n2(LED[2],nand1,nand1);
   or a2(LED[4],SW[3],SW[2]);
   xor a3(LED[5],SW[5],SW[6]);
   xnor a4(LED[6],SW[8],SW[7]);
   assign LED[3] = SW[0] && SW[1];

*/