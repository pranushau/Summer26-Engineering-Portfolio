module alu_4bit (
	input [3:0] A,
	input [3:0] B,
	input [2:0] operation,
	output [3:0] result
);

	wire [3:0] and_result;
	wire [3:0] or_result;
	wire [3:0] xor_result;
	wire [3:0] add_result;
	wire [3:0] not_B;
	wire [3:0] sub_result;
	wire [3:0] normal_result;
	
	ripple_adder_4bit adder (
                .A(A),
                .B(B),
                .cin(1'b0),
                .sum(add_result),
       	        .cout()
        );

	assign and_result = A & B;
	assign or_result = A | B;
	assign xor_result = A ^ B;

	mux_4to1_4bit alu_mux (
                .i0(and_result),
                .i1(or_result),
		.i2(xor_result),
		.i3(add_result),
		.s0(operation[0]),
		.s1(operation[1]),
		.y(normal_result)
	);

	mux_2to1_4bit final_mux (
		.a(normal_result),
		.b(sub_result),
		.sel(operation[2]),
		.c(result)
	);

	not_gate sub0 (
		.a(B[0]),
		.c(not_B[0])
	);
	
	not_gate sub1 (
		.a(B[1]),
		.c(not_B[1])
	);

	not_gate sub2 (
		.a(B[2]),
		.c(not_B[2])
	);

	not_gate sub3 (
		.a(B[3]),
		.c(not_B[3])
	);

	ripple_adder_4bit subtractor (
		.A(A),
		.B(not_B),
		.cin(1'b1),
		.sum(sub_result),
		.cout()
	);

endmodule
