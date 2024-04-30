`timescale 1ns / 1ps
module Traffic_light_TB;
reg sensor_c,reset,clk;
reg [6:0] Timeout;
reg [3:0] timeout;
wire[2:0] highway_light,country_light;
topmodule top(
.clk(clk),
.sensor_c(sensor_c),
.Timeout(Timeout),
.timeout(timeout),
.reset(reset),
.highway_light(highway_light),
.country_light(country_light));
initial begin
	clk<=0;
	reset<=0;
	sensor_c<=0;
	Timeout<=5;
	timeout<=2;
	#7 sensor_c<=1;
	#20 sensor_c<=0;
	#30 sensor_c<=1;
	#40 reset<=1;
	#20 reset<=0;
	end
always begin
 #1 clk=!clk;
 end
 endmodule
	