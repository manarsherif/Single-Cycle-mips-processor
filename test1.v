module mips (
//	output Branch, 
	//output MemRead , 
//	output MemWrite,
//	output MemToReg,
//	output AluOp,
//	output AluSrc,
//	output RegWrite,
//	output jump,
//	output logical,
//	output ReadData1,ReadData2,
//	output npc,
//	output pcplusfour,
	input pc ,
	input reset ,
	input clk ,

	);
wire [31:0]npc;
	wire [31:0]pc;
	wire reset;	 
	wire clk; 
	wire [31:0] Instruction; 
	wire [31:0]pcplusfour;
	wire logical; 
	wire jump; 
	wire RegWrite;
	wire AluSrc; 
	wire [1:0]AluOp;
	wire [1:0]MemToReg;
	wire MemWrite; 
	wire  MemRead ;	 
	wire  Branch;
	wire [1:0] RegDes; 
	wire [31:0]WriteData;
	wire [4:0]WriteRegister; 
	wire [31:0]ReadData1;
	wire [31:0]ReadData2; 	
	wire RegWrite1;
	wire jr1; 
	wire jr ;
	wire [31:0]immediate;
	wire [31:0]AluIn; 
	wire [2:0]alucontrol;
	wire [31:0]aluresult;
	wire zerosignal; 
	wire [31:0]memout; 
	wire [27:0]jumpshift;  
	wire [31:0]jumpaddress;
	programcounter pc1(npc,pc,clk);
	InstructionMem inst( Instruction,npc); 
	Adder add1( pcplusfour,4,npc);
	ControlUnit control ( RegDes, Branch, MemRead ,MemWrite,MemToReg,AluOp,AluSrc,RegWrite,jump,logical,Instruction[31:26]); 
	mux_4X1_5bits m1(WriteRegister,Instruction[20:16],Instruction[25:21],RegDes); 
	not(jr1,jr);
	and(RegWrite1,jr1,RegWrite);
	RegisterFile f1(ReadData1,ReadData2,Instruction[25:21],Instruction[20:16],WriteRegister,WriteData,RegWrite1);  
	sign_extend s1(immediate,Instruction[15:0],logical); 
	mux_2X1_31bits m2(AluIn,ReadData2,immediate,AluSrc);
	alu_control a1(Instruction[5:0],AluOp,alucontrol,jr);
	alu a2(aluresult,zerosignal,ReadData1,AluIn,alucontrol,Instruction[10:6]);
	data_memory m3(aluresult,ReadData2,memout,MemWrite,MemRead); 
	sll_jump s2(jumpshift,Instruction[25:0]);
	concatination c1(jumpaddress,jumpshift, pcplusfour[31:28]);
	
endmodule