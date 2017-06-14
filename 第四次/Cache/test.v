`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:30:10 06/07/2017
// Design Name:   Top
// Module Name:   C:/Users/linco/Desktop/Cache/test.v
// Project Name:  Cache
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg CLK;
	reg [31:0] AB;
	reg CMWr;
	reg RD;

	// Bidirs
	wire [31:0] D;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.CLK(CLK), 
		.AB(AB), 
		.CMWr(CMWr), 
		.RD(RD), 
		.D(D)
	);

	reg [31:0]DD;
	assign D = DD;
	
	  always #10 CLK = !CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		CMWr = 0;
		
		RD = 0;		
		assign DD = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
		AB = 32'b00000000000000000000000000000000;
		
		#100;
		RD = 0;	
		assign DD = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
		AB = 32'b00000000000000000000000000010000;

		#150;		
		CMWr = 1;
		RD = 1;
		AB = 32'b00000000000001000000000000100000;
		assign DD = 32'b10001000100010001000100010001000;
		// Add stimulus here

		#150;		
		CMWr = 1;
		RD = 1;
		AB = 32'b00000000000000000000000000110000;
		assign DD = 32'b11001100110011001100110011001100;
	end
      
endmodule



