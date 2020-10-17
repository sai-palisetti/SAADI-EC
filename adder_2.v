module adder_2(in1_adder2,in2_adder2,out_adder2,counter,t);

parameter n=8;
//input clk;
input[2*n-1:0] in1_adder2,in2_adder2;
input [n-1:0] counter,t;
output reg [2*n-1:0] out_adder2;  

always@*
begin
	if(counter==1<<t)
	out_adder2=in2_adder2+in1_adder2;
end

endmodule