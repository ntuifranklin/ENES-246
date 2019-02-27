# AndNand
The goals of this lab are to begin looking at the ways **Vivado** modifies our code.   

**Vivado** tires to get rid of constants.   

**Vivado** looks at different verilog abstractions of the same circuit and does what?   

**Vivado** simplifies circuits we tell it to build, freeing us from trying to build efficient circuits.

## project_1 constants

Project_1 is playing with voltage controlled buffers just like the previous lab, except it is using constants.

#### Port Diagram

![Port_Diagram_Project_1](Port_Diagram_Project_1.PNG)

#### Verilog Code

![1547913933708](1547913933708.png)

#### RTL Schematic Screen shot

![RTL_Schematic_Screen_Shot_Project_1](RTL_Schematic_Screen_Shot_Project_1.PNG)

#### Synthesis Schematic Screen shot

![Synthesis_Schematic_Screen_Shot_Project_1](Synthesis_Schematic_Screen_Shot_Project_1.PNG)

#### Implementation Device screen shot zoomed in on something interesting

![Implementation_Device_Screen_Shot_Project_1](Implementation_Device_Screen_Shot_Project_1.PNG)

#### Testing

*A logical 1 is visible in the verilog code (vcb.v) and yet the RTL analysis schematic gets rid of the logical constant and is identical to the previous lab. Why? Draw a diagram similar to the RTL analysis with containing the design intent of the verilog code.*

*What happens if the order of 1 and sw0  are switched (and the order of 1 and sw1) in the verilog code?*

Answer : When we switch the 1 and sw0 and the 1 and sw1, the code generates an error saying we cannot have a constant as the first argument of bufif1

Comment out the lines:

​	set_property CFGBVS VCCO [current_design]
​	set_property CONFIG_VOLTAGE 3.3 [current_design]

in the xdc file. 

*What error messages are generated?*  

Error Message generated : 

[DRC CFGBVS-1] Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0



*Which (RTL, Synthesis, Implement or Generate Bitstream) causes failure?* 

*Which starts complaining first about these two lines?*

*What technology is in the Xilinx FPGA we are using TTL, CMOS, etc. ? Provide a link to the web site where you looked up the answer.*

*What is w in the verilog code? Is it necessary?* 

## project_2 andGates

In this project an "And" gate is created four different ways. Test it. Show your instructor all four ways working. 

#### Port Diagram

![Port_Diagram_Project_2](Port_Diagram_Project_2.PNG)

#### Verilog Code

`timescale 1ns / 1ps

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

#### RTL Schematic Screen shot

![RTL_Schematic_Screen_Shot_Project_2](RTL_Schematic_Screen_Shot_Project_2.PNG)

#### Synthesis Schematic Screen shot

![Synthesis_Schematic_Screen_Shot_Project_2](Synthesis_Schematic_Screen_Shot_Project_2.PNG)

#### Implementation Device screen shot zoomed in on something interesting

![Implementation_Device_Screen_Shot_Project_2](Implementation_Device_Screen_Shot_Project_2.PNG)

#### Testing

*Which of the four ways is the most attractive way to code?*

The assign command : 

assign LED[3] = sw0 && sw1

*At what level of verilog code abstraction is the **assign** command?*

At the compilation level.

*Does order of the verilog commands (sequence of commands) change anything?*

In the code below :   
`timescale 1ns / 1ps
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

The order of the instructions after the variable declaration does not matter as long as the nand instructions stay together, and the wire nand1 instruction comes first.

*What are a1,b1,n1,n2 associated with the gate names called in Verilog?*

The a1 is a variable name for the AND instruction. 
The b1 is a variable name for the buffer tri-state instruction.
The n1 and n2 are variable names associated with the NAND commands.

*In the language C, the names between () look like variables passing data to some kind of function, object or subroutine. What do the represent in verilog?* 
They represent parameters that are passed to the verilog routines. For example the instruction : 
nand n1(LED[2], nand1,nand2) tells verilog that we want to create a nand operation with the result LED[2] being assigned the NAND operation of the operands nand1 and nand1.

*At what step (RTL, Synthesis, Implementation, BitFile) did Vivado figure out that most of the LED's were doing the same thing?* 

*Implement each and gate one at a time. List any differences between them at the RTL or Synthesis states here. Take screen shots if you want or describe them verbally.* 



## project_3 XOR and Nand Gates

You create this from scratch.

Use the "[assign](https://www.utdallas.edu/~akshay.sridharan/index_files/Page5212.htm)" command, 3 switches, and 2 LEDs to create a three input Nand gate and a three input XOR gate. Put them all in one project. 

#### Port Diagram

![Port_Diagram_Project_3](Port_Diagram_Project_3.PNG)

#### Verilog Code

![Verilog_Code_Project_3](Verilog_Code_Project_3.PNG)

#### RTL Schematic Screen shot

![RTL_Schematic_Screen_Shot_Project_3](RTL_Schematic_Screen_Shot_Project_3.PNG)

#### Synthesis Schematic Screen shot

![Synthesis_Schematic_Screen_Shot_Project_3](Synthesis_Schematic_Screen_Shot_Project_3.PNG)

#### Implementation Device screen shot zoomed in on something interesting

![Implementation_Device_Screen_Shot_Project_3](Implementation_Device_Screen_Shot_Project_3.PNG)

#### Testing

*XOR gates have evolved with [two different implementations](https://en.wikipedia.org/wiki/XOR_gate#More_than_two_inputs) with three or more inputs.  Which does the verilog assign command implement?*

The assign command implements the implementation where by the output is true when an odd number of inputs are true.   This makes it practically useful as a parity generator or a modulo-2 adder.

## Ethics

The ethics questions below are more important than your answers. The goal in answering them is to remember the question. So the best answers are a non-trivial, thoughtful, relevant hypothesis. 

#### Ethics of EDIF

EDIF (Electric Design Interchange Format)  captures a battle between engineers trying to use tools like Vivado and engineers designing Vivado. They both have to make money. *Summarize this wikipedia article  on the death of [EDIF](https://en.wikipedia.org/wiki/EDIF) standards in less than 200 words:*

This course is asking you to document circuits first with the port diagram and then screen shots of Vivado and finally a discussion of testing. You are in the role of an engineering using Vivado on a project. *Which verilog version of the project_1 circuit (simple or complex) should be entered into Vivado?  When is a more complex circuit a good thing and a simplified, reduced circuit a bad thing?*



