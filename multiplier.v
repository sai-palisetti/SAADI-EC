module multiplier(counter,t,clk,mul_in1,mul_in2,mul_out);
parameter n=8;
input clk;
input [n-1:0] counter,t;
input [n-1:0] mul_in1;
input [n-1:0] mul_in2;
output reg [n-1:0] mul_out;  // multiplier output is truncated from 2n bits to n bits
reg [2*n-1:0] temp;
//assign mul_out=[2*n-1:n] temp;

always@*
begin
	if(counter<=(1<<t))
	begin
		temp=mul_in1*mul_in2;
		mul_out=temp>>n;
	end
end


endmodule