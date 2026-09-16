module instruction_memory (
	input [31:0] address,
	output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin
	memory[0] = 32'h002081B3;
	memory[1] = 32'h40208233;
	memory[2] = 32'h0020F2B3;
	memory[3] = 32'h0020E333;
	memory[4] = 32'h0020C3B3;
	memory[5] = 32'h00000013;
end

assign instruction = memory[address[9:2]];

endmodule
