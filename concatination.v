module concatination(
	output [31:0]jumpaddress,
	input [27:0]jumpshift,
	input [3:0]addresssig
	);
	assign jumpaddress[27:0]=jumpshift;
	assign jumpaddress[31:28]=addresssig;
endmodule