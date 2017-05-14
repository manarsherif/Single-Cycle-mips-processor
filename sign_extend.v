module sign_extend(
	output reg [31:0]result,
	input wire [15:0]immediate,
	input wire logical
	);	  
	always @(immediate or logical) 
		#2
		if (logical==0)	
			begin 
				result[31:16]<={16{immediate[15]}};
				result[15:0]<=immediate[15:0];
			end
		else if (logical==1)
		begin 
			result [31:16]<=0;	
			result[15:0]<=immediate[15:0]; 
		end
	endmodule