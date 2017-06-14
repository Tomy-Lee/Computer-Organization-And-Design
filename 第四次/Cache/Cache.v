`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:25 06/08/2017 
// Design Name: 
// Module Name:    Cache 
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
module Cache(
				input CLK,
				input RD, 
				input CMWr,
				input [31:0]AB,
				inout [31:0]D,
				inout [31:0]MD,
				output MRd
    );
	reg [13:0]TBMemory[0:16283];
	reg [7:0]cacheMemory[0:262143];
	reg [3:0]count;
	reg [31:0] _D, _MD;
	reg _MRd;
	
	assign D = _D;
	assign MD = _MD;
	assign MRd = _MRd;
	
	initial begin
		count = 4'b0000;
		_MRd = 1;
		TBMemory[14'b000000000000] = 14'b000000000000;
		cacheMemory[32'h00000000] = 8'b00000000;
		cacheMemory[32'h00000001] = 8'b00000000;
		cacheMemory[32'h00000002] = 8'b00000000;
		cacheMemory[32'h00000003] = 8'b00000001;
		cacheMemory[32'h00000004] = 8'b00000000;
		cacheMemory[32'h00000005] = 8'b00000000;
		cacheMemory[32'h00000006] = 8'b00000000;
		cacheMemory[32'h00000007] = 8'b00000010;
		cacheMemory[32'h00000008] = 8'b00000000;
		cacheMemory[32'h00000009] = 8'b00000000;
		cacheMemory[32'h0000000A] = 8'b00000000;
		cacheMemory[32'h0000000B] = 8'b00000011;
		cacheMemory[32'h0000000C] = 8'b00000000;
		cacheMemory[32'h0000000D] = 8'b00000000;
		cacheMemory[32'h0000000E] = 8'b00000000;
		cacheMemory[32'h0000000F] = 8'b00000100;
		TBMemory[14'b000000000010] = 14'b000000000001;
		cacheMemory[32'h00000020] = 8'b00000000;
		cacheMemory[32'h00000021] = 8'b00000000;
		cacheMemory[32'h00000022] = 8'b00000000;
		cacheMemory[32'h00000023] = 8'b00001001;
		cacheMemory[32'h00000024] = 8'b00000000;
		cacheMemory[32'h00000025] = 8'b00000000;
		cacheMemory[32'h00000026] = 8'b00000000;
		cacheMemory[32'h00000027] = 8'b00001010;
		cacheMemory[32'h00000028] = 8'b00000000;
		cacheMemory[32'h00000029] = 8'b00000000;
		cacheMemory[32'h0000002A] = 8'b00000000;
		cacheMemory[32'h0000002B] = 8'b00001011;
		cacheMemory[32'h0000002C] = 8'b00000000;
		cacheMemory[32'h0000002D] = 8'b00000000;
		cacheMemory[32'h0000002E] = 8'b00000000;
		cacheMemory[32'h0000002F] = 8'b00001100;
	end
	
	always@(posedge CLK) begin
		if (RD == 0 && MRd == 1) begin 
			if (AB[31:18] == TBMemory[AB[17:4]]) begin 
				_D[31:24] = cacheMemory[AB[17:0]+(count<<2)];
				_D[23:16] = cacheMemory[AB[17:0]+(count<<2)+1];
				_D[15:8] =  cacheMemory[AB[17:0]+(count<<2)+2];
				_D[7:0] =   cacheMemory[AB[17:0]+(count<<2)+3];
				count = 4'b0000;
			end 
			else begin
				_MRd = 0;
				TBMemory[AB[17:4]] = AB[31:18];
				_MD = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
			end
		end
		else if (RD == 0) begin
			if (count != 0) begin
				cacheMemory[AB[17:0]+ ((count-1) << 2)] = MD[31:24];
				cacheMemory[AB[17:0]+ ((count-1) << 2) +1] = MD[23:16];
				cacheMemory[AB[17:0]+ ((count-1) << 2) +2] = MD[15:8];
				cacheMemory[AB[17:0]+ ((count-1) << 2) +3] = MD[7:0];
			end
			count = (count + 4'b0001);
			if (count == 4'b0101)
				count = 4'b0000;
			if (count == 4'b0000)
				_MRd = 1;
		end
		else if (CMWr == 1) begin
			_D = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
			if (AB[31:18] == TBMemory[AB[17:4]]) begin
				cacheMemory[AB[17:0]+ (count << 2)] = D[31:24];
				cacheMemory[AB[17:0]+ (count << 2) +1] = D[23:16];
				cacheMemory[AB[17:0]+ (count << 2) +2] = D[15:8];
				cacheMemory[AB[17:0]+ (count << 2) +3] = D[7:0];
				_MD[31:24] = D[31:24];
				_MD[23:16] = D[23:16];
				_MD[15:8] = D[15:8];
				_MD[7:0] = D[7:0];
			end
			else begin
				_MD[31:24] = D[31:24];
				_MD[23:16] = D[23:16];
				_MD[15:8] = D[15:8];
				_MD[7:0] = D[7:0];
			end
		end
	end
endmodule
