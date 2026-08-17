module not_gate_tb;
reg a;
wire c;

not_gate uut(
	.a(a),
	.c(c)
);

initial begin
	$display("Starting test...");
	a = 0; #10;
	$display("a=%b c=%b", a, c);
	a = 1; #10;
	$display("a=%b c=%b", a, c);
	$finish;
end

endmodule
