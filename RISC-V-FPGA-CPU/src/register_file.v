module register_file (
	input clk,
	input write_enable,
	input [4:0] write_addr,
	input [31:0] write_data,
	input [4:0] read_addr1,
	input [4:0] read_addr2,
	output reg [31:0] read_data1,
	output reg [31:0] read_data2
);

reg [31:0] registers [0:31];

initial begin 
	registers[0] = 32'b0;
	registers[1] = 32'd5;
	registers[2] = 32'd3;
end

always @(posedge clk) begin
	if (write_enable && write_addr != 0) begin
		registers[write_addr] = write_data;
	end
end

always @(*) begin
	read_data1 = registers[read_addr1];
	read_data2 = registers[read_addr2];
end

endmodule
