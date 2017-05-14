module ControlUnit ( RegDes , Branch , MemRead , MemWrite, MemToReg , ALUOP , ALUSRC , RegWrite , Jump , Logical , OPcode);
output RegDes , Branch , MemRead , MemWrite , ALUOP , ALUSRC , RegWrite , Jump , Logical , MemToReg ;	

input [5:0] OPcode;		 
reg [1:0] RegDes;
reg Branch;
reg MemRead;
reg MemWrite;
reg [1:0]MemToReg;
reg [1:0] ALUOP;
reg ALUSRC;
reg RegWrite;
reg Jump;
reg Logical;
always@(OPcode)
	begin 
		
case (OPcode)  // R-Format Instruction
	 6'b000000: begin 
	 Branch     <= 1'b0;
	 Jump       <= 1'b0;
	 MemRead    <= 1'b0;
	 MemWrite   <= 1'b0;
	 MemToReg   <= 2'b00;
	 ALUOP      <= 2'b10;
	 ALUSRC     <= 1'b0;
	 RegWrite   <= 1'b1;
	 RegDes     <= 2'b01;
	 // Logical    <=1'b0;
	 end   
	   //I-Format (Addi) instruction
	 6'b001000:  begin  
	 Branch     <= 1'b0;
	 Jump       <= 1'b0;
	 MemRead    <= 1'b0;
	 MemWrite   <= 1'b0;
	 MemToReg   <= 2'b00;
	 ALUOP      <= 2'b00;
	 ALUSRC     <= 1'b1;
	 RegWrite   <= 1'b1;
	 RegDes     <= 2'b00;
	 Logical    <=1'b0;
	 end 
	   //I-Format (LoadWord) instruction
	 6'b100011:  begin
     Branch     <= 1'b0;
	 Jump       <= 1'b0;
	 MemRead    <= 1'b1;
	 MemWrite   <= 1'b0;
	 MemToReg   <= 2'b01;
	 ALUOP      <= 2'b00;
	 ALUSRC     <= 1'b1;
	 RegWrite   <= 1'b1;
	 RegDes     <= 2'b00;
	 Logical    <=1'b0;
	 end 
	 	 //I-Format (StoreWord) instruction
	 6'b101011:  begin
     Branch     <= 1'b0;
	 Jump       <= 1'b0;
	 MemRead    <= 1'b0;
	 MemWrite   <= 1'b1;
	 //MemToReg   <= 2'b01;
	 ALUOP      <= 2'b00;
	 ALUSRC     <= 1'b1;
	 RegWrite   <= 1'b0;
	 //RegDes     <= 2'b00;
	 Logical    <=1'b0;
	 end  		   
  //I-Format (beq) instruction
	 6'b000100:  begin
     Branch     <= 1'b1;
	 Jump       <= 1'b0;
	 MemRead    <= 1'b0;
	 MemWrite   <= 1'b0;
	 //MemToReg   <= 2'b01;
	 ALUOP      <= 2'b01;
	 ALUSRC     <= 1'b0;
	 RegWrite   <= 1'b0;
	 //RegDes     <= 2'b00;
	 Logical    <=1'b0;
	 end  		   
	  //I-Format (Andi) instruction
	 6'b001100:  begin
     Branch     <= 1'b0;
	 Jump       <= 1'b0;
	 MemRead    <= 1'b0;
	 MemWrite   <= 1'b0;
	 MemToReg   <= 2'b00;
	 ALUOP      <= 2'b11;
	 ALUSRC     <= 1'b1;
	 RegWrite   <= 1'b1;
	 RegDes     <= 2'b00;
	 Logical    <=1'b1;
	 end  		  	  
	 //J-Format (Jump) instruction
	 6'b000010 : begin 
     Branch     <= 1'b0;
	 Jump       <= 1'b1;
	 MemRead    <= 1'b0;
	 MemWrite   <= 1'b0;
	// MemToReg   <= 2'b10;
	 //ALUOP    <= 2'b11;
	//ALUSRC  <= 1'b1;
	 RegWrite   <= 1'b0;
	 //RegDes     <= 2'b10;
	 //logical <=1'b1;
	 end  		  	  
// Jal Instruction

6'b000011: begin  
	Branch     <= 1'b0;
	 Jump       <= 1'b1;
	 MemRead    <= 1'b0;
	 MemWrite   <= 1'b0;
	 MemToReg   <= 2'b10;
	 //ALUOP    <= 2'b11;
	//ALUSRC  <= 1'b1;
	 RegWrite   <= 1'b1;
	 RegDes     <= 2'b10;
	 //logical <=1'b1;
	
	   end 
endcase
     end 
endmodule

