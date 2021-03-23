module UnidaddeControl(
input clk,
input [3:0] outrest,
input [4:0] outflag,
input [3:0] swdata,
output [3:0] iA,
output [3:0] iB,
output [3:0] opcode,
output [3:0] cont,
output led
);
//Registros 
reg [3:0] iA_D;
reg [3:0] iA_Q;
reg [3:0] iB_D;
reg [3:0] iB_Q;
reg [3:0] opcode_D;
reg [3:0] opcode_Q;
reg [3:0] cont_D;
reg [3:0] cont_D;
reg leds_D;
reg leds_Q;
reg [1:0] actstate;
reg [1:0] nxtstate;

//Asignaciones
assign led = leds_Q;
assign iA = iA_Q;
assign iB = iB_Q;
assign cont = cont_Q;
assign opcode = opcode_Q;

//Bloque Secuencial
always @(posedge clk)
begin 
	led_Q <= led_D;
	iA_Q <= iA_D;
	iB_Q <= iA_D;
	cont_Q <= cont_D;
	opcode_Q <= opcode_D;
	actstate <= nxtstate;
end 

//Bloque combinacional
always @(*)
begin 
	
 
