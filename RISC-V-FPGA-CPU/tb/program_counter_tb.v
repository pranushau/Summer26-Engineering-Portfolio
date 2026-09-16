module program_counter_tb;
	reg clk;
	reg reset;
	wire [31:0] pc;

program_counter uut (
	.clk(clk),
	.reset(reset),
	.pc(pc)
);

always #5 clk = ~clk;
initial begin
	clk = 0;
	reset = 1;

	#10;
	$display("After reset: PC = %d", pc);
	
	reset = 0;

	#10;
	$display("After 1 clock: PC = %d", pc);

	#10;
	$display("After 2 clocks: PC = %d", pc);

	$finish;
end

endmodule
