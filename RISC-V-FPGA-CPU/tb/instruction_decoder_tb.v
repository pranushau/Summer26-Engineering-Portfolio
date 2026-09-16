module instruction_decoder_tb;

reg [31:0] instruction;
wire [2:0] alu_select;

instruction_decoder uut (
	.instruction(instruction),
	.alu_select(alu_select)
);

initial begin
	instruction = 32'b00000000000000000111000010110011;
	#10;
	$display("AND: alu_select = %b", alu_select);

	instruction = 32'b00000000000000000110000010110011;
	#10;
	$display("OR: alu_select = %b", alu_select);

	instruction = 32'b00000000000000000100000010110011;
	#10;
	$display("XOR: alu_select = %b", alu_select);

	instruction = 32'b00000000000000000000000010110011;
	#10;
	$display("ADD: alu_select = %b", alu_select);

	instruction = 32'b01000000000000000000000010110011;
	#10;
	$display("SUB: alu_select = %b", alu_select);

    $finish;
end

endmodule
