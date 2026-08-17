module mux_2to1(
	input a,
	input b,
	input sel,
	output c
);

	assign c = (a & ~sel) | (b & sel);
endmodule
