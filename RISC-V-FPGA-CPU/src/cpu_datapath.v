module cpu_datapath (
	input clk,
	input [31:0] instruction,
	input write_enable,
	input [31:0] write_data,
	input [4:0] write_addr,
	input cpu_write_enable,
	output [3:0] alu_result,
	output [3:0] read1,
	output [3:0] read2
);

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [31:0] reg_read1;
wire [31:0] reg_read2;
wire [31:0] alu_result_32;
wire [4:0] final_write_addr;
wire [31:0] final_write_data;
wire final_write_enable;

assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign rd = instruction[11:7];
assign alu_result_32 = {28'b0, alu_result};
assign final_write_addr = cpu_write_enable ? rd : write_addr;
assign final_write_data = cpu_write_enable ? alu_result_32 : write_data;
assign final_write_enable = write_enable | cpu_write_enable;

register_file registers (
	.clk(clk),
	.write_enable(final_write_enable),
	.write_addr(final_write_addr),
	.write_data(final_write_data),
	.read_addr1(rs1),
	.read_addr2(rs2),
	.read_data1(reg_read1),
	.read_data2(reg_read2)
);

assign read1 = reg_read1[3:0];
assign read2 = reg_read2[3:0];

wire [2:0] alu_select;

instruction_decoder decoder (
	.instruction(instruction),
	.alu_select(alu_select)
);

alu_4bit alu (
	.A(read1),
	.B(read2),
	.operation(alu_select),
	.result(alu_result)
);

endmodule
