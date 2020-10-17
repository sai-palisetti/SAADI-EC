module twos_comp(counter,b,x,clk);
parameter n=8;
input [n-1:0] b;
input [n-1:0]counter;
input clk;
output reg [n-1:0] x;

always@*
begin
	if(counter==(1<<1))
	x=~b+1'b1;
end
endmodule