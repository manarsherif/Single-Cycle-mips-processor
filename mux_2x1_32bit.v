module mux_2X1_31bits(
	output reg [31:0]out,
	input  [31:0]ReadData2,[31:0]immediate,
	input AluSrc
	); 
always @( AluSrc or ReadData2 or immediate)
	
	begin
	if( AluSrc==0)
		out=ReadData2;
	else if ( AluSrc==1)
		out=immediate;
	 end
endmodule