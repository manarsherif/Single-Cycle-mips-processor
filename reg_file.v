module RegisterFile(
	output wire [31:0] ReadData1,
	output wire  [31:0] ReadData2,
	input wire [4:0] ReadRegister1,
	input wire [4:0] ReadRegister2,
	input wire [4:0] WriteRegister,
	input wire [31:0] WriteData,
	input RegisterWrite,
	input clk
	);
 
//reg [31:0] ReadData1,ReadData2;
reg [31:0]registers [31:0] ; 
 initial 
	  begin 
		$readmemh("memory.list",registers);  
	  end 
always@(ReadRegister1 or ReadRegister2 or WriteRegister or WriteData or  RegisterWrite or clk)											 
	 #10;
	assign ReadData1 = registers[ReadRegister1] ;
	assign ReadData2 = registers[ReadRegister2] ;	 
	// 	if(RegisterWrite && WriteRegister != 0) #30 registers[WriteRegister] = WriteData ;

 
always @(posedge clk)
			 if(RegisterWrite && WriteRegister != 0) registers[WriteRegister] = WriteData ;
  
endmodule