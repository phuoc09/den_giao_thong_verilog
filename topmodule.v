module topmodule(input clk,
			  input sensor_c,
			  input [6:0] Timeout,
			  input [3:0] timeout,
			  input reset,
			  output [2:0] highway_light,
			  output [2:0] country_light);
countryway c1(
.clk(clk),
.sensor_c(sensor_c),
.Timeout(Timeout),
.timeout(timeout),
.reset(reset),
.out_h(highway_light),
.out_c(country_light));
highway h1(
.clk(clk),
.sensor_c(sensor_c),
.Timeout(Timeout),
.timeout(timeout),
.reset(reset),
.out_h(highway_light),
.out_c(country_light));
endmodule
