module basys_3_top (
	input clk,	
	input btnC,
	output [4:0] led
);

wire reset;
wire cpu_write_enable;

assign reset = btnC;
assign cpu_write_enable = 1'b1;
assign led = dut.datapath.registers.registers[3][4:0];

cpu dut (
	.clk(clk),
	.reset(reset),
	.write_enable(1'b0),
	.write_addr(5'b0),
	.write_data(32'b0),
	.cpu_write_enable(cpu_write_enable)
);

endmodule
