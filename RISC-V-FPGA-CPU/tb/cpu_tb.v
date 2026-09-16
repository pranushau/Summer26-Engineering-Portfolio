`timescale 1ns/1ps

module cpu_tb;

reg clk;
reg reset;
reg write_enable;
reg [4:0] write_addr;
reg [31:0] write_data;
reg cpu_write_enable;

cpu dut (
	.clk(clk),
	.reset(reset),
	.write_enable(write_enable),
	.write_addr(write_addr),
	.write_data(write_data),
	.cpu_write_enable(cpu_write_enable)
);

always #5 clk = ~clk;

initial begin 
	clk = 0;
	reset = 1;
	write_enable = 0;
	write_addr = 0;
	write_data = 0;
	cpu_write_enable = 0;
	
	#10;
	write_enable = 1;
	write_addr = 5'd1;
	write_data = 32'd5;

	#10;
	write_addr = 5'd2;
	write_data = 32'd3;

	#10;
	write_enable = 0;
	cpu_write_enable = 1;
	reset = 0;

	#46;
	$display("x3 = %d x4 = %d x5 = %d x6 = %d x7 = %d", dut.datapath.registers.registers[3], dut.datapath.registers.registers[4], dut.datapath.registers.registers[5], dut.datapath.registers.registers[6], dut.datapath.registers.registers[7]);
	$display("PC = %d instruction =%h", dut.pc, dut.instruction);

	$finish;
end

endmodule
