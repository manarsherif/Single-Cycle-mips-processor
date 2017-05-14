module mux_4X1_5bits(
	output reg [4:0]out,
	input  [4:0]rt,[4:0]rd,
	input [1:0]RegDes
	); 
always @(RegDes or rt or rd)	
	if(RegDes==2'b00)
		out=rt;
	else if (RegDes==2'b01)
		out=rd;
	else if (RegDes==2'b10)
		out=  5'b11111;
	else if (RegDes==2'b11)
		out=0; 	
endmodule