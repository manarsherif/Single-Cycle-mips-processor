 module Adder (nextpc ,pc,inp);
	input [31:0] pc ;
	input [31:0] inp;
	output nextpc;
	
	reg [31:0] nextpc;
	
	always @ (pc or inp)
	begin 
		nextpc <= pc+inp;
	end 
	endmodule 