# LotsOfGates
Vivado turns all circuits into the primitives of a CLB Slice: LUTs, muxes, carry-logic, xor gates, d flip flops. Understanding these is the goal of this course. We have covered XOR gates.  The goal of this lab is to understand LUTs. 

The goal here is to predict [LookUpTables](https://en.wikipedia.org/wiki/Lookup_table) (LUTS) values.
Then find their contents in Vivado and compare.
Then look at how Vivado deals with identical circuits. 

## Project_1

Below is a diagram of a circuit with two outputs. The outputs are identical. The bottom part with two input gates reduces to the top circuit of one three input Nand gate. The circuit was built in  [logisim](https://sourceforge.net/projects/circuit/) which is a java runtime program free to download. The logisim circuit called [two identical circuits](https://github.com/ENES-246DigitalElectronics/ENES246/blob/master/-4LotsOfGates/TwoIdenticalCircuits.circ), can also be downloaded.  The top circuit uses one gate. The bottom circuit uses 5 gates.  The question is what does Vivado do with these circuits?

![1548098400293](1548098400293.png)

#### Port Diagram

![Port_Diagram_Project_1](Port_Diagram_Project_1.PNG)

#### Verilog Code

![Verilog_Code_Project_1](Verilog_Code_Project_1.PNG)

#### RTL Schematic Screen shot

![RTL_Schematic_Screen_Shot_Project_1](RTL_Schematic_Screen_Shot_Project_1.PNG)

#### Synthesis Schematic Screen shot

![Synthesis_Schematic_Screen_Shot_Project_1](Synthesis_Schematic_Screen_Shot_Project_1.PNG)

#### Implementation Device screen shot zoomed in on something interesting

![Implementation_Device_Screen_Shot_Project_1](Implementation_Device_Screen_Shot_Project_1.PNG)

#### Testing

One might expect that Vivado would reduce these to a single circuit and reuse the circuit. There have been software packages that do this.  The logisim software can do this. Download logisim and the circuit above, and with this circuit open in logisim, go to project, analyze the circuit, minimize, set as expression for output x, set as expression for output y, ok, yes sure. *What happens?*

*Add screen shot of logisim of the resulting circuit.*  

![X_Circuit_Project_1](X_Circuit_Project_1.PNG)

![Y_Circuit_Project_1](Y_Circuit_Project_1.PNG)



Now explore what Vivado does in your screen shots above. Clearly Vivado could see two identical circuits. *What does Vivado do instead?*

To see Vivado LUT's truth tables, click on schematic, right click on the LUT and choose cell properties, move the tab from General to truth table. *Add screen shots of the Vivado LUT truth tables.* 

![Truth_Table_1](Truth_Table_1.PNG)

![Truth_Table_2](Truth_Table_2.PNG)

Obviously Vivado understands the verilog code. *How are the truth tables the same?* 

The truth tables match except at the 4th and 6th line.

The first truth table has as output the expression : I0 AND NOT I1 AND I2

The second truth table has as output the expression : I0 AND I1 AND NOT I2 

*How are the truth tables different? What did Vivado do to make the circuits different?* 

In one expression the second variable is complemented, while in the second expression, it's the third variable that is complemented.

The first truth table has as output the expression : I0 AND NOT I1 AND I2

The second truth table has as output the expression : I0 AND I1 AND NOT I2 

## Project_2

Repeat project_1 with your own design. Develop two identical circuits. Build the first circuit with 3 inputs, 2 outputs and at least 5 gates. The second circuit can be a simple version of the first.  Then repeat the instructions of project 1.  Document your circuit with the port diagram and screen shots. 

#### Port Diagram

![Port_Diagram_Project_2](Port_Diagram_Project_2.PNG)

#### Verilog Code

![Verilog_Code_Project_2](Verilog_Code_Project_2.PNG)

#### RTL Schematic Screen shot

![RTL_Schematic_Screen_Shot_Project_2](RTL_Schematic_Screen_Shot_Project_2.PNG)

#### Synthesis Schematic Screen shot

![Synthesis_Schematic_Screen_Shot_Project_2](Synthesis_Schematic_Screen_Shot_Project_2.PNG)

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

![Implementation_Device_Screen_Shot_Project_2](Implementation_Device_Screen_Shot_Project_2.PNG)

*Is anything different?* 

# Ethics of choosing which Algorithms to Teach

You are student at a university. *Why would professors demand in the first course on digital circuit design that you learn  [Karnaugh Maps,](https://en.wikipedia.org/wiki/Karnaugh_map)  [Quine McCluskey Algorithm](https://en.wikipedia.org/wiki/Quine%E2%80%93McCluskey_algorithm), and  [Petrick Cover](https://en.wikipedia.org/wiki/Petrick%27s_method), which seems unrelated to the labs, doesn't predict Vivado behavior and is at best buried in the Vivado software?*

Karnaugh maps and Quine McCluskey algorithms are two different ways to minimize a function's expression. We can minimize with one algorithm and use the other algorithm to check our answer. Designing logic circuits with the Vivado software helps us understand which algorithm is Vivado using to draw two identical circuits for example. We get a better understanding of how large circuits could be reduced to save money, and be more efficient.

Suppose you are engineer designing the Vivado software. You get the question from a customer, a fellow engineer using your companies product and paying your salary: "Why doesn't Vivado see one circuit?" Read this [forum post](https://forums.xilinx.com/t5/Synthesis/Question-about-LUT-usage-in-a-very-very-simple-combinatorial/td-p/221143).  *What is your answer to this question?*

Engineers develop conspiracy theories when trying to predict the future. *Given the above chaos discovered in Vivado while doing the labs above, what do you expect to happen as you try to cram larger and larger circuits into an FPGA?* 

