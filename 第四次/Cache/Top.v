`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:15:38 06/06/2017 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(
	input CLK,
	input [31:0]AB,
	input CMWr,
	input RD, 
	inout [31:0]D
    );
	wire [31:0]MD;
	wire MRd;
	RAM myRAM(CLK, CMWr, MRd, AB, MD);
	Cache myCache(CLK, RD, CMWr, AB, D, MD, MRd);

endmodule
