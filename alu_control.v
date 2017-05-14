module alu_control(
	input [5:0]func ,
	input [1:0]aluop ,
	output reg [2:0]alucontrol,
	output reg jr
	); 
	
initial begin
   jr = 0;
end	 

	
always @(func or aluop) begin  
	
	if(func == 6'b001000 && aluop==2'b10)
		jr <= 1'b1;
	else
		jr <= 1'b0;
end
	
always @(func or aluop)	
	
	if (aluop==2'b00) //add	
		alucontrol=3'b011;
	else if (aluop==2'b01)	//sub
		alucontrol=3'b100;
	else if (aluop==2'b11)
		alucontrol=3'b000; 
	else if  (aluop==2'b10) //rformat
		begin
			if (func == 6'b100100)  //and
				alucontrol = 3'b000;
			else if (func == 6'b100101)//or
				alucontrol = 3'b001;
			else if (func == 6'b101010) //slt
				alucontrol = 3'b010;
			else if (func == 6'b100000)//add
				alucontrol = 3'b011;
			else if(func == 6'b100010) //sub
				alucontrol = 3'b100;
			else if (func == 6'b100111) //nor
				alucontrol = 3'b101;
			else if (func == 6'b000000) //shift
				alucontrol = 3'b110;
		
		end
endmodule