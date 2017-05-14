module mux_4X1_32bits(
	output reg [31:0] WriteData,
	input [31:0] AluResult,
	input [31:0] Mem,
	input [31:0] pcplusfour,
	input [1:0]MemToReg
	); 
always @(MemToReg or AluResult or Mem or pcplusfour)	
	if(MemToReg==2'b00)
		WriteData=AluResult;
	else if (MemToReg==2'b01)
		WriteData=Mem;
	else if (MemToReg==2'b10)
		WriteData= pcplusfour;
	else if (MemToReg==2'b11)
		WriteData=0; 	
endmodule