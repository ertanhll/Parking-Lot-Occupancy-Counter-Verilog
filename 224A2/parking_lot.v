`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:51 12/19/2023 
// Design Name: 
// Module Name:    parking_lot 
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
module parking_lot(clk,rst,btn,dtc,cnt);
	input clk, rst;
	input [1:0] btn;
	output reg [1:0] dtc;
	output reg [2:0] cnt; 
	
	reg [1:0] Sp;
	reg [1:0] Sn;
	reg [2:0] cnt_n;
	
	always@ (posedge clk) begin
		
		Sp <= Sn;
		cnt <= cnt_n;
		
	end
	
	always @(*) begin
	
		case({rst,Sp,btn}) 
		
		5'b1xxxx :{Sn,dtc} = 4'b0000;
		
		5'b00000 : {Sn,dtc} = 4'b0000;
		5'b00010 : {Sn,dtc} = 4'b1000;
		5'b01011 : {Sn,dtc} = 4'b1100;
		5'b01101 : {Sn,dtc} = 4'b0100;
		5'b00100 : {Sn,dtc} = 4'b0001;
		
		
		5'b00001 : {Sn,dtc} = 4'b0100;
		5'b00111 : {Sn,dtc} = 4'b1100;
		5'b01110 : {Sn,dtc} = 4'b1000;
		5'b01000 : {Sn,dtc} = 4'b0011;
		

		endcase
	end
	
	always @ * begin
		
		if(dtc == 2'b01)
		 cnt_n = cnt + 3'b1;
		else if (dtc == 2'b11)
		cnt_n = cnt - 3'b1;
		else 
		cnt_n=cnt;
	end
endmodule
