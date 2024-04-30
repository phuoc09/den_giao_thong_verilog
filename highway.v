module highway(clk,sensor_c,reset,Timeout,timeout,out_c,out_h);
		input clk;
		input sensor_c;
		input[6:0] Timeout;
		input [3:0] timeout;
		input[2:0] out_c;
		input reset;
		output reg [2:0] out_h;
parameter green_h =3'b001,yellow_h=3'b010,red_h=3'b100;

parameter size=3;
reg [size-1:0] state;
reg [3:0] count;

always@(posedge clk or posedge reset )
begin
	if(reset==1) 
	begin
		state<=green_h;
		count<=0;
	end
	else begin
	case(state)
		green_h : if (count<Timeout || sensor_c==0) 
						begin
							state<=green_h;
							count=count+1;				
						end else 
						begin
							state<=yellow_h;
							count<=0;	
								end
							
					
		yellow_h: if(count<timeout) 
						begin
							count<=count+1;
							state<=yellow_h;
						end else 
						begin
							count<=0;
							state<=red_h;
							
						end
		red_h:    
							if( out_c==3'b100 && count==1)
						begin
							state<=green_h;
							count<=0;
						end
							else
						begin
							state<=red_h;
							count<=count+1;
						end
		default : state<=green_h;
	endcase
	end
end
always@(state)
	begin
	case(state)
		green_h :begin out_h<=3'b001;end
		yellow_h :begin out_h<=3'b010;end
		red_h  : begin out_h<=3'b100;end
		default out_h<=3'b000;
	endcase
	end
endmodule
					
		
	
		
					