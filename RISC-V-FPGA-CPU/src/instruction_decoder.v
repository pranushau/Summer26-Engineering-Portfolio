module instruction_decoder (
	input [31:0] instruction,
	output reg [2:0] alu_select
);

wire [6:0] opcode;
wire is_rtype;
wire [2:0] funct3;
wire [6:0] funct7;

assign opcode = instruction[6:0];
assign is_rtype = (opcode == 7'b0110011);
assign funct3 = instruction[14:12];
assign funct7 = instruction[31:25];

always @(*) begin
	if (is_rtype && funct3 == 3'b111)
		alu_select = 3'b000;
	else if (is_rtype && funct3 == 3'b110)
		alu_select = 3'b001;
	else if (is_rtype && funct3 == 3'b100)
		alu_select = 3'b010;
	else if (is_rtype && funct3 == 3'b000 && funct7 == 7'b0000000)
		alu_select = 3'b011;
	else if (is_rtype && funct3 == 3'b000 && funct7 == 7'b0100000)
		alu_select = 3'b100;
end

endmodule
