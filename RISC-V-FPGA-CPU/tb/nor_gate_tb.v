module nano_gate_tb;
reg a;
reg b;
wire c;

nor_gate uut (
	.a(a),
	.b(b),
	.c(c)
);

initial begin
	$display("Starting test...");
	a = 0; b = 0; #10;
	$display("a=%b b=%b c=%b", a, b, c);
	a = 0; b = 1; #10;
	$display("a=%b b=%b c=%b", a, b, c); 
	a = 1; b = 0; #10;
	$display("a=%b b=%b c=%b", a, b, c); 
	a = 1; b = 1; #10;
	$display("a=%b b=%b c=%b", a, b, c);  
	$finish;
end 

endmodule
