module alu_4bit_tb;
	reg [3:0] A;
	reg [3:0] B;
	reg [1:0] operation;
	wire [3:0] result;

	alu_4bit uut (
		.A(A),
		.B(B),
		.operation(operation),
		.result(result)
	);

	initial begin 
		A = 4'b1010;
		B = 4'b1100;

		operation = 2'b00;
		#10;
		$display("AND: result=%b", result);

		operation = 2'b01;
		#10;		$display("OR: result=%b", result);

		operation = 2'b10;
		#10;
		$display("XOR: result=%b", result);

		operation = 2'b11;
		#10;
		$display("ADD: result=%b", result);

		$display("and=%b or=%b xor=%b add=%b",
			uut.and_result,
			uut.or_result,
			uut.xor_result,
			uut.add_result);

		$display("operation=%b s0=%b s1=%b",
			operation,
			uut.alu_mux.s0,
			uut.alu_mux.s1);

		$display("MUX: i0=%b i1=%b i2=%b i3=%b y=%b",
         		uut.alu_mux.i0,
         		uut.alu_mux.i1,
         		uut.alu_mux.i2,
         		uut.alu_mux.i3,
         		uut.alu_mux.y);

		$finish;
		
		end

endmodule
