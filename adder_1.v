module adder_1(in1_adder1,in2_adder1,out_adder1,counter,t);

parameter n=8;
//input clk;
input[n-1:0] in1_adder1,in2_adder1;
input [n-1:0] counter,t;
output reg [n-1:0] out_adder1;  

always@*
begin
	if(counter==(1<<t))
	out_adder1=in2_adder1-in1_adder1;
end

endmodule