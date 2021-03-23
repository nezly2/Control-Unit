module TOP(
input ireloj,
input [3:0] dsw,        //Dip switch
output equal,		//LEDS, un solo bit para cuando son iguales se hace 0 
output [3:0] count	//Leds contador
);

wire [3:0]res;		//Cables para conectar la salida de la ALU a la unidad de control, resultado ALU
wire [4:0]flags;	//Cables para conectar las flags de la ALU a la unidad de control
wire [3:0]opcod;	//Cable OpCode de la unidad de control a la ALU
wire [3:0]inA;		//Cable iA de la unidad de control a la ALU
wire [3:0]inB;		//Cable iB de la unidad de control a la ALU
wire clk1;		



DIV CLKsss(
	.clk(ireloj),
	.clk1(clk1)
);

ContU Uctrl(
	.sw(dsw),
	.clk(clk1),
	.ledz(equal),
	.counter(count),
	.iA(inA),
	.iB(inB),
	.Opcode(opcod),
	.flags(flags),
	.outALU(res)
	
);

ALU Uniarit(
	.iA(inA),
	.iB(inB),
	.OpCode(opcod),
	.clk(clk1),
	.Flag(flags),
	.Oz(res)
);

endmodule