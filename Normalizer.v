module normalizer(clk,counter,in_norm,out_norm,e);
parameter n=8;
input [n-1:0]counter;
input clk;
input [n-1:0]in_norm;
output reg [n-1:0]out_norm;
output reg [n-1:0]e;
reg [n-1:0] a= 0;
reg [n-1:0] temp_norm;
reg [2:0] i=7;

// assign e=a;
// always@(posedge clk)
// temp_norm=in_norm;

always@(in_norm)
begin
	temp_norm=in_norm;
		
	if(counter<=(1<<1) || counter<=(1<<2))
	begin

	 // while(in_norm[7]==0)
		// begin
		
			// temp_norm ={temp_norm[n-2:0],temp_norm[n-1]};
			// a=a-1;
			// i=i-1;
		// end
		a=0;
		i=7;
		if(in_norm[7]==1)
		begin
		
			out_norm =temp_norm;
			a=0;
		end
		
		else if(in_norm[6]==1)
		begin
		
			out_norm ={temp_norm[n-2:0],1'b0};
			a=-1;
		end
		else if(in_norm[5]==1)
		begin
		
			out_norm ={temp_norm[n-3:0],{2{1'b0}}};
			a=-2;
		end
		
		else if(in_norm[4]==1)
		begin
		
			out_norm ={temp_norm[n-4:0],{3{1'b0}}};
			a=-3;
		end
		
		else if(in_norm[3]==1)
		begin
		
			out_norm ={temp_norm[n-5:0],{4{1'b0}}};
			a=-4;
		end
		
		else if(in_norm[2]==1)
		begin
		
			out_norm ={temp_norm[n-6:0],{5{1'b0}}};
			a=-5;
		end
		else if(in_norm[1]==1)
		begin
		
			out_norm ={temp_norm[n-7:0],{6{1'b0}}};
			a=-6;
		end
		else if(in_norm[0]==1)
		begin
		
			out_norm ={temp_norm[0],{7{1'b0}}};
			a=-7;
		end
		
		e=a;
	end
	
	//out_norm=temp_norm;
end


endmodule