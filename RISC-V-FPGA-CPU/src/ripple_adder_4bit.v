module ripple_adder_4bit (
	input [3:0] A,
	input [3:0] B,
	input cin,
	output [3:0] sum,
	output cout
);

	// Store intermediate carries here:
	wire c1;
	wire c2;
	wire c3;

full_adder fa0 (
	.a(A[0]),
	.b(B[0]),
	.carry_in(cin),
	.sum(sum[0]),
	.carry_out(c1)
);     

full_adder fa1 (
	.a(A[1]),
	.b(B[1]),
	.carry_in(c1),
	.sum(sum[1]),
	.carry_out(c2)
);

full_adder fa2 (
	.a(A[2]),
	.b(B[2]),
	.carry_in(c2),
	.sum(sum[2]),
	.carry_out(c3)
);

full_adder fa3 (
	.a(A[3]),
	.b(B[3]),
	.carry_in(c3),
	.sum(sum[3]),
	.carry_out(cout)
);
endmodule
