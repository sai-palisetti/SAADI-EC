`timescale 1ns/1ps
module top_tb_new;
parameter n=8;

 reg [n-1:0] A;
 reg [n-1:0] B;
 reg [n-1:0] t;
 reg reset,clk;
 wire [2*n-1:0]Q;
 wire [2*n-1:0]Qc;
 
 integer a_val,b_val,t_val;
 integer i,j;
 ///
 reg [n-1:0] counter=1;

 reg [n-1:0] int_Q;
 reg [n-1:0] temp_frac_Q;
 real frac_Q;
 real val;
 integer fileId;
 //////


top dut(reset,clk,A,B,t,Q,Qc);

initial begin
	//for creating vcd waveform file to view in gtkwave
	
	$dumpfile ("saadi.vcd"); 
    $dumpvars(0, top_tb_new);
	clk =1'b0;
	  fileId = $fopen("SAADI_EC_Changed_NORM.csv","w");

	if (!$value$plusargs("t_VAL=%d",t_val ))
		t_val=7;
	t = t_val;
	
	reset =0;
	#1 reset=1;
	#2 reset=0;
	end
	initial begin
	for (i=1;i<256;i=i+1) begin
		for (j=1;j<256;j=j+1) begin
			A=i;
			B=j;
			# 70;
			
		end
	
	end
	   
end

always #5 clk=~clk;
always@(posedge clk)
begin
	if(counter==1<<t)
		counter<='d 2;
	else
		counter <={counter[n-2:0],counter[n-1]};
end

always @(posedge clk)
begin 
if (counter == 1<<t) begin
	//if(!$value$plusargs("=%d",b_val )){}
	int_Q = Qc[2*n-1:n-1];
	val = 2**(n-1);

	frac_Q =int_Q + Qc[n-2:0]/val;
	
	$fdisplay(fileId,"%.5f",frac_Q);
	end
end

initial #4587520 $finish;
// initial #3000 $finish;
endmodule
