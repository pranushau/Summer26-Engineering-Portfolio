module program_counter (
	input clk,
	input reset, 
	output [31:0] pc
);

reg [31:0] pc_reg;

assign pc = pc_reg;

always @(posedge clk) begin
	if (reset)
		pc_reg <= 32'b0;
	else
		pc_reg <= pc + 4;
end

endmodule

