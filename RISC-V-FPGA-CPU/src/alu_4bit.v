module alu_4bit (
	input [3:0] A,
	input [3:0] B,
	input [1:0] operation,
	output [3:0] result
);

	wire [3:0] and_result;
	wire [3:0] or_result;
	wire [3:0] xor_result;
	wire [3:0] add_result;
	
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
		.y(result)
	);

endmodule
