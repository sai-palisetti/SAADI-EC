module shifter_2(in1_shifter2,in2_shifter2,shifter2_out,t,counter);
parameter n=8;
input [n-1:0] counter,t;
input [2*n-1:0] in1_shifter2;
input [n-1:0] in2_shifter2;
output reg [2*n-1:0] shifter2_out; 
reg [2*n-1:0]temp_shifter2;

always@*
begin
	if(counter==1<<t)
	begin
		//temp_shifter2=8'b0;
		temp_shifter2 = in1_shifter2>>in2_shifter2;
		shifter2_out=temp_shifter2;
	end
	
end

endmodule