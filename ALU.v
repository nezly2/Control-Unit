//Practica 2
//Febrero 5, 2021
//Nezly Yáñez
//Flavio Jimenez
//Luis Martinez

module ALU(
	input [3:0] iA,
	input [3:0] iB,
	input clk,
	input [3:0] opCode,
	output [4:0] status, //flag
	output [3:0] result 
	);

//[P,Z,C,S,O] Status Flag
//[4,3,2,1,0] 

reg [4:0] resultado_D; //De 5 bits para poder contar el carry
reg [4:0] resultado_Q;
reg [4:0] flag_D;
reg [4:0] flag_Q;

assign result = resultado_Q [3:0];
assign status = flag_Q;

always @*
 begin
 
 if((resultado_D[2:0] <= 3'b111)&&(flag_D[2] == 1))//Overflow Flag
	begin
		flag_D[0]=1;
	end
 else
	begin
		flag_D[0]=0;
	end

 if(resultado_D[3] == 1)//Sign Flag
	begin
		flag_D[1]=1;
	end
 else
	begin
		flag_D[1]=0;
	end

 if((resultado_D[4] == 1))//Carry Flag  
	begin 
		flag_D[2]=1;
	end
 else
	begin
		flag_D[2]=0;
   end
 
 
 if(resultado_D[3:0] == 0)//Zero Flag
	begin
		flag_D[3]=1;
	end
 else
	begin
		flag_D[3]=0;
	end
 
 
 if(resultado_D[3] ^ resultado_D[2] ^ resultado_D[1] ^  resultado_D[0])//Parity Flag
	begin
		flag_D[4]=1;
	end
 else 
	begin
		flag_D[4]=0; 
	end

	case(opCode)
		
		4'b0001: resultado_D = (iA + iB); 			 //0001:Suma
		4'b0010: resultado_D = (iA - iB); 			 //0010:Resta
		4'b0011: resultado_D = (iA & iB);			 //0011:And
		4'b0100: resultado_D = (iA | iB);			 //0100:Or
		4'b0101: resultado_D = ~(iA); 				 //0101:Not
		4'b0110: resultado_D = (iA ^ iB); 			 //0110:Xor
		4'b0111: resultado_D = ~iA;					 //0111:Complemento a 1
		4'b1000: resultado_D = ((~iA)+1); 			 //1000:Complemento a 2
		4'b1001: resultado_D = iA << 1;				 //1001:Shift aritmético izquierda
		4'b1010: resultado_D = {iA[3],iA[3:1]};	 //1010:Shift aritmético derecha 
		4'b1011: resultado_D = iA << 1;				 //1011:Shift lógico izquierda
		4'b1100: resultado_D = iA >> 1;				 //1100:Shift lógico derecha
		4'b1101: resultado_D = {iA[2:0],iA[3]};	 //1101:Rotación izquierda
		4'b1110: resultado_D = {iA[0],iA[3:1]};	 //1110:Rotación derecha
	endcase
 end 
always @(posedge clk)
begin 
resultado_Q <= resultado_D;
flag_Q <= flag_D;
end
endmodule
 