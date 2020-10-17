module shifter_1(t,counter,shifter_1_in1,shifter_1_in2,shifter_1_out);
parameter n=8;
input [n-1:0] counter,t;
input [n-1:0] shifter_1_in1;
input [n-1:0] shifter_1_in2;
output reg [2*n-1:0] shifter_1_out; 
reg [2*n-1:0]temp_shifter_1=0;
always@(*)
begin
	if(counter==1<<t)
	begin
		if(shifter_1_in2[n-1]==0)
			temp_shifter_1=shifter_1_in1<<(shifter_1_in2);
			
		else
			temp_shifter_1=shifter_1_in1>>(256-shifter_1_in2);
			
		shifter_1_out=temp_shifter_1 ;
	end
	
end

endmodule