module data_memory(
	input [31:0] address,
	input [31:0]data_in,
	output reg [31:0] data_out,
	input memwrite,
	input memread,
	input clk );
	
	reg[7:0]my_memory[0:255];
	
initial 
begin 
$readmemh("memory2.list",my_memory);

end		

always @(posedge clk)
	begin	 
		#30
		if (memwrite )
			begin 
			my_memory[address]<=data_in[31:24];
			my_memory[address+1]<=data_in[23:16];
			my_memory[address+2]<=data_in[15:8];
			my_memory[address+3]<=data_in[7:0];
			end 
	end	 
	
always @ (address or data_in or memread) 
	begin
	if (memread) 
		begin 
			#40
		data_out[31:24]<=my_memory[address];
			data_out[23:16]<=my_memory[address+1];
			data_out[15:8]<=my_memory[address+2];
			data_out[7:0]<=my_memory[address+3];	
		end 
	end 
/*always @(address or data_in or memwrite or memread)
	begin
		
		if (memwrite&&~memread)begin 
			#6
			my_memory[address]<=data_in[31:24];
			my_memory[address+1]<=data_in[23:16];
			my_memory[address+2]<=data_in[15:8];
			my_memory[address+3]<=data_in[7:0];
		end

	else if (memread&&~memwrite)begin 
		#6
			data_out[31:24]<=my_memory[address];
			data_out[23:16]<=my_memory[address+1];
			data_out[15:8]<=my_memory[address+2];
			data_out[7:0]<=my_memory[address+3];
		end 
	end*/
endmodule 