module alu(output reg[31:0]aluresult,
	output reg zerosignal,
	input wire[31:0]r1,
	input wire[31:0]r2,
	input wire[2:0]alucontrolinput, 
	input wire[4:0]shiftamount
);	
				 

	always @(alucontrolinput or r1 or r2 or shiftamount)
		begin  
			 #7
			if(r1-r2==0)
				zerosignal<=1'b1;
			else
				zerosignal<=1'b0; 
				
			
			//if(alucontrol==2'b00)
			case (alucontrolinput)
				3'b011:  //	add
					aluresult<=r1+r2;
				3'b100:	   //sub
					aluresult<=r1-r2;
				3'b000://and
					aluresult<=r1&r2;
				3'b001:		//or
					aluresult<=r1|r2;
				3'b010://slt
					begin
						if(r1<r2)
							aluresult<=1;
						else 
							aluresult<=0;
					end 
				3'b110: //shift
					aluresult<=	r2<<shiftamount; 
				3'b101:	//nor
					aluresult<=	~(r1|r2);
						
			endcase
			
		end
	
endmodule