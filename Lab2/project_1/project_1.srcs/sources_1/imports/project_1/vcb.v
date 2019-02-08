`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   input  sw2,
   output tri LED
   );
   bufif1 b1(LED, sw0, sw0);
   bufif1 b2(LED, sw1, sw1);
   bufif1 b3(LED, sw2, sw2);
endmodule