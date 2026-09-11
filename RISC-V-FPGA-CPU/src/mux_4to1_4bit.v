module mux_4to1_4bit (
	input [3:0] i0,
	input [3:0] i1,
	input [3:0] i2,
	input [3:0] i3,
	input s0,
	input s1,
	output [3:0] y
);

	wire [3:0] a;
	wire [3:0] b;

	assign a = s0 ? i1 : i0;
	assign b = s0 ? i3 : i2;
	assign y = s1 ? b : a;

endmodule 
 
