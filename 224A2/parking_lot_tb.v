`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:01 12/19/2023 
// Design Name: 
// Module Name:    parking_lot_tb 
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
module parking_lot_tb;
		reg clk;
		reg rst;
		reg [1:0] btn;
		wire [1:0] dtc;
		wire [2:0] cnt;
	
		parking_lot uut(clk,rst,btn,dtc,cnt);
		
		initial forever begin 
		
		clk = 1'b0; 
		#5;
		clk = 1'b1;
		#5;
		
		end
		
		initial begin 
		 
		rst = 1'b1;
		#10;
		rst = 1'b0;
		#4000;
		
		end
		
		
		
		initial begin
			
				btn = 2'b00;
				#40;
				btn = 2'b10;
				#40;
				btn = 2'b11;
				#40;
				btn = 2'b01;
				#40;
				btn = 2'b00;
				#40;
		
			
			
				btn = 2'b00;
				#40;
				btn = 2'b01;
				#40;
				btn = 2'b11;
				#40;
				btn = 2'b10;
				#40;
				btn = 2'b00;
				#40;
			
		end
		
		initial begin 
		
		#4000;
		$finish;
		
		end



endmodule
