module Accumlator(in1_acc,in2_acc,out_acc,clk,counter,t);
parameter n=8;
input clk; 
input [n-1:0] in1_acc,in2_acc,counter,t;
output [n-1:0] out_acc;
reg [n-1:0] temp_acc;
// always@(posedge clk)
// begin
	// temp_acc<=temp_acc+in1_acc;
// end
assign out_acc= (counter==1<<t-1)?{1'b1,temp_acc[n-1:1]}:temp_acc;

always@(*)
begin
	if (counter<(1<<t))
	temp_acc= in1_acc+in2_acc;
	
end

endmodule