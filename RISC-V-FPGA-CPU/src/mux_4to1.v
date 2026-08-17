module mux_4to1 (
	input i0,
	input i1,
	input i2,
	input i3,
	input s0,
	input s1,
	output y
);
	assign a = (i0 & s0) | (i1 & ~s0);
	assign b = (i2 & s0) | (i3 & ~s0);
	assign y = (a & s1) | (b & ~s1);
endmodule
