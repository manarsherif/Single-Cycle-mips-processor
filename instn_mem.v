module InstructionMem(
	output reg [31:0]  Instruction,	
	input[31:0] ReadAddress
	);
	reg[7:0] mem [0:255];
	initial 
	  begin 
		$readmemb("memory1.list",mem); 
		 Instruction[31:0] =32'b0;
	  end  
	 

	always @ (ReadAddress)
		begin	
			#10
			if (mem[ReadAddress] ===8'bxxxx_xxxx)
				$finish;
			Instruction[31:24] <= mem[ReadAddress];
			Instruction[23:16] <= mem[ReadAddress+1];
			Instruction[15:8] <= mem[ReadAddress+2];
			Instruction[7:0] <= mem[ReadAddress+3];	
			//if (Instruction[31:0] ===32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx)
				//$finish;
		end
endmodule