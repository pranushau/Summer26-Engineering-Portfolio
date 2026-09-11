module mux_4to1_tb;

	reg i0;
	reg i1;
	reg i2;
	reg i3;
	reg s0;
	reg s1;
	wire y;

	mux_4to1 uut (
		.i0(i0),
		.i1(i1),
		.i2(i2),
		.i3(i3),
		.s0(s0),
		.s1(s1),
		.y(y)
	);

	initial begin

		i0 = 1;
		i1 = 0;
		i2 = 0;
		i3 = 0;

		s0 = 0;
		s1 = 0;
		#10;
		$display("s1s0=%b%b, y=%b", s1, s0, y);

		s0 = 0;
		s1 = 1;
		#10;
		$display("s1s0=%b%b, y=%b", s1, s0, y);

		s0 = 1;
		s1 = 0;
		#10;
		$display("s1s0=%b%b, y=%b", s1, s0, y);
		
		s0 = 1; 
                s1 = 1; 
                #10;
                $display("s1s0=%b%b, y=%b", s1, s0, y);

	end

endmodule
