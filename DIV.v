module DIV(
input wire clk,
input wire clr,
output wire clk1);

reg [24:0]a;

always @(posedge clk or posedge clr)
begin 
	if(clr == 1)
		a <= 0;
		
	else 
		a <= a+1;
	end 
	
	assign clk1 = a[24];
endmodule 
