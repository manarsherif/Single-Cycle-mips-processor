module ShiftLeft ( output1,input1);
	input [31:0] input1;
	output  output1;
	reg [31:0] output1;
	
always@(input1)
	begin 
		output1<=input1<<2;
	end 
		
endmodule