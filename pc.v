module programcounter( 
    output  reg [31:0]	npc	, 
	input [31:0] pc,
	input clk
	);				
	reg reset;
	
	initial begin
		reset = 1;
		#100 reset = 0;	
	end				  
	
	always @(posedge clk)
	begin
	    if(reset)
	        npc = 0 ;
	    else
	        npc = pc ;
	end
endmodule