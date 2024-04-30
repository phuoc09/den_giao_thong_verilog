
module countryway(clk,sensor_c,Timeout,timeout,reset,out_h,out_c);
		input clk;
		input[6:0] Timeout;
		input[3:0] timeout;
		input sensor_c;
		input[2:0] out_h;
		input reset;
		output reg [2:0] out_c;
parameter green_c =3'b001,yellow_c=3'b010,red_c=3'b100;
parameter size=3;
reg [size-1:0] state;
reg [6:0] count=0;
always@(posedge clk or posedge reset )
begin
	if(reset==1) 
	begin
		state<=red_c;
		count<=0;
	end
	else begin
	case(state)
		green_c : if (count<Timeout) 
						begin
							count<=count+1;
							state<=green_c;
						end else 
						begin 
							state<=yellow_c;							
							count<=0;
						end
		yellow_c: if(count<timeout) 
						begin
							count<=count+1;
							state<=yellow_c;
						end else 
						begin
							state<=red_c;
							count<=0;						
						end
		red_c:   		 if(out_h==3'b100 && sensor_c==1)
								begin
									state<=green_c;													
								end
							else
								begin
									state<=red_c;
								end
		default : state<=red_c;
	endcase
	end
end
always@(state)
	begin
	case(state)
		green_c :begin out_c<=3'b001;end
		yellow_c :begin out_c<=3'b010;end
		red_c  : begin out_c<=3'b100;end
		default out_c<=3'b000;
	endcase
	end
endmodule
					
		
	
		
					