module register_file_test;
	reg clk;
	reg write_enable;
	reg [4:0] write_addr;
	reg [31:0] write_data;
	reg [4:0] read_addr1;
	reg [4:0] read_addr2;
	wire [31:0] read_data1;
	wire [31:0] read_data2;

register_file dut (
	.clk(clk),
	.write_enable(write_enable),
	.write_addr(write_addr),
	.write_data(write_data),
	.read_addr1(read_addr1),
	.read_addr2(read_addr2),
	.read_data1(read_data1),
	.read_data2(read_data2)
);

always #5 clk = ~clk;
initial begin 
	clk = 0;
	write_enable = 0;
	write_addr = 0;
	write_data = 0;
	read_addr1 = 0;
	read_addr2 = 0;

	#10;
	write_enable = 1;
	write_addr = 5;
	write_data = 42;

	#10;
	read_addr1 = 5;
	#1;
	$display("x5 = %d", read_data1);

	#10;
	read_addr2 = 5;
	#1;
	$display("x5 = %d", read_data2);

	#10;
	write_enable = 1;
	write_addr = 0;
	write_data = 42;

	#10;
	read_addr1 = 0;
	#1;
	$display("x0 = %d", read_data1);
end

endmodule
