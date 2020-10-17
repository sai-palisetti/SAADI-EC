module lut #(parameter n=8)(
input [n-1:0] t,
output reg [n-1:0] s

);
always@*
begin
	
	
	
			case(t)
				1: s=4;
				2: s=6;
				3: s=6;
				4: s=6;
				5: s=7;
				6: s=7;
				7: s=7;
				default:s=0;
			endcase		
	
	
end
endmodule