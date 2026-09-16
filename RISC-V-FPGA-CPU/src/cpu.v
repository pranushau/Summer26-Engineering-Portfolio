module cpu (
	input clk, 
	input reset, 
	input write_enable,
	input [4:0] write_addr,
	input [31:0] write_data,
	input cpu_write_enable
);

wire [31:0] pc;
wire [31:0] instruction;
wire [3:0] alu_result;
wire [3:0] read1;
wire [3:0] read2;

program_counter pc_unit (
	.clk(clk),
	.reset(reset),
	.pc(pc)
);

instruction_memory imem (
	.address(pc),
	.instruction(instruction)
);

cpu_datapath datapath (
	.clk(clk),
	.instruction(instruction),
	.write_enable(write_enable),
	.write_addr(write_addr),
	.write_data(write_data),
	.cpu_write_enable(cpu_write_enable),
	.alu_result(alu_result),
	.read1(read1),
	.read2(read2)
);

endmodule
