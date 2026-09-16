`timescale 1ns/1ps

module cpu_datapath_test;

reg clk;
reg [31:0] instruction;
reg write_enable;
reg [4:0] write_addr;
reg [31:0] write_data;
reg cpu_write_enable;

wire [3:0] alu_result;
wire [3:0] read1;
wire [3:0] read2;

cpu_datapath dut (
	.clk(clk),
	.instruction(instruction),
	.write_enable(write_enable),
	.write_addr(write_addr),
	.write_data(write_data),
	.alu_result(alu_result),
	.read1(read1),
	.read2(read2),
	.cpu_write_enable(cpu_write_enable)
);

always #5 clk = ~clk;

initial begin
	clk = 0;
	instruction = 0;
	write_enable = 0;
	write_addr = 0;
	write_data = 0;
	cpu_write_enable = 0;

	write_enable = 1;
	write_addr = 5'd1;
	write_data = 32'd5;

	#10;

	write_addr = 5'd2;
	write_data = 32'd3;
	
	#10;

	write_enable = 0;

	instruction = 32'h002081B3;

	cpu_write_enable = 1;

	#10;

	$display("read1=%d read2=%d alu_result=%d x3=%d", read1, read2, alu_result, dut.registers.registers[3]);

	$finish;
end 

endmodule
