module clock(clk);
	output reg clk;
	initial begin
		clk = 0;
	end
	
	always begin
		#50 clk = ~clk;
	end
endmodule