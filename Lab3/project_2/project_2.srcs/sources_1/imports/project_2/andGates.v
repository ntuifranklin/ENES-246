`timescale 1ns / 1ps

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
   
endmodule

/*

module vcb(
   input  sw0,
   input  sw1,
   output [3:0] LED
   );
   wire nand1;
   and a1(LED[0],sw0,sw1);
   bufif1 b1(LED[1], sw0, sw1);
   nand n1(nand1,sw0,sw1);
   nand n2(LED[2],nand1,nand1);
   assign LED[3] = sw0 && sw1;
   
endmodule

*/