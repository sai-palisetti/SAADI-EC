`include "Normalizer.v"
`include "Accumulator.v"
`include "twos_comp.v"
`include "multiplier.v"
`include "adder_1.v"
`include "shifter.v"
`include "shifter_2.v"
`include "lut.v"
`include "adder_2.v"

module top(reset,clk,A,B,t,Q,Qc);
parameter n=8;

input [n-1:0] A;
input [n-1:0] B;
input [n-1:0] t;
input reset,clk;
output wire [2*n-1:0]Q;
output wire [2*n-1:0]Qc;
reg [n-1:0] counter;
//

reg [n-1:0] temp_mul_out;
reg [n-1:0] temp_eb;
reg [n-1:0] temp_out_acc;


wire [n-1:0]in_norm;
wire [n-1:0]out_norm;
wire [n-1:0]e;
wire [n-1:0] var_x;
wire [n-1:0] b;
wire [n-1:0] mul_in1;
wire [n-1:0] mul_in2;
wire [n-1:0] mul_out;
wire [n-1:0] in1_acc,in2_acc;
wire [n-1:0] out_acc;
wire [n-1:0] in1_adder1;
wire [n-1:0] in2_adder1;
wire [n-1:0] out_adder1;
wire [n-1:0] shifter_1_in1;
wire [n-1:0] shifter_1_in2;
wire [2*n-1:0] shifter_1_out; 
wire [n-1:0] s;
wire [2*n-1:0] in1_shifter2;
wire [n-1:0] in2_shifter2;
wire [2*n-1:0] shifter2_out; 
wire [2*n-1:0] in1_adder2,in2_adder2;
wire [2*n-1:0] out_adder2;  


normalizer normalizer_uut(clk,counter,in_norm,out_norm,e);
twos_comp twos_comp_uut(counter,b,var_x,clk);
multiplier multiplier_uut(counter,t,clk,mul_in1,mul_in2,mul_out);
Accumlator Accumlator_uut(in1_acc,in2_acc,out_acc,clk,counter,t);
adder_1 adder_1_uut(in1_adder1,in2_adder1,out_adder1,counter,t);
shifter_1 shifter_1_uut(t,counter,shifter_1_in1,shifter_1_in2,shifter_1_out);
lut #(8) lut_dut(t,s);
shifter_2 shifter_2_uut(in1_shifter2,in2_shifter2,shifter2_out,t,counter);
adder_2 adder_2_uut(in1_adder2,in2_adder2,out_adder2,counter,t);

// connect the normalizer inputs based on current cycle
assign in_norm = (counter==1<<1)?B:(counter==1<<2)?A: 'bx;
// twos_comp
assign b = (counter==1<<1)?out_norm:'bx;
// connect the multiplier inputs based on current cycle 
assign mul_in1 = (counter==1<<t)? temp_out_acc:var_x;
assign mul_in2 = (counter==1<<t)? out_norm:(counter==1<<1)?var_x:temp_mul_out;
// connect accumlator inputs
assign in1_acc = mul_out;
assign in2_acc = (counter==1<<1)?var_x:temp_out_acc;
// connect adder_1
assign in2_adder1 = e;
assign in1_adder1 = temp_eb;
// connect shifter
assign shifter_1_in1=mul_out;
assign shifter_1_in2=out_adder1;
// connect shifter2 
assign in1_shifter2 = shifter_1_out;
assign in2_shifter2 = s;
// connect adder_2

assign in1_adder2 = shifter_1_out;
assign in2_adder2 = shifter2_out;


assign Q=shifter_1_out;
assign Qc=out_adder2;

always@(posedge clk or posedge reset)
begin
if (reset)
		counter<=8'd 1;
else begin
	if(counter==1<<t)
		counter<='d 2;
	else
		counter <={counter[n-2:0],counter[n-1]};
end
end
always@(posedge clk)
begin
	temp_mul_out<= mul_out;  // store multiplier output for next cycle
	temp_out_acc<=out_acc;
	if(counter==1<<1)
		temp_eb <= e;
	//if(counter==1<<2)
	//	temp_ea <= e;
end
endmodule




