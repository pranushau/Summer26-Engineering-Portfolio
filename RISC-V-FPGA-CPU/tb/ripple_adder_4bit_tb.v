module ripple_adder_4bit_tb;
	reg [3:0] A;
	reg [3:0] B;
	reg cin;
	wire [3:0] sum;
	wire cout;

	ripple_adder_4bit uut (
		.A(A),
		.B(B),
		.cin(cin),
		.sum(sum),
		.cout(cout)
	);

	initial begin
		A = 4'b1011;
		B = 4'b0110;
		cin = 0;

		#10;

		$display("A=%b B=%b cin=%b | sum=%b cout=%b", A, B, cin, sum, cout);

		$finish;
	end

endmodule
