module sll_jump( jumpshift,input1);
	input [25:0] input1;
	output  jumpshift;
	reg [27:0] jumpshift;
	
always@(input1)
	begin 
		jumpshift<=input1<<2;
	end 
		
endmodule