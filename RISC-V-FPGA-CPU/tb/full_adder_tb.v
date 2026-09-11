module full_adder_tb;
	// 1. Declare signals with registers (inputs) and wires (outputs)
	reg a;
	reg b;
	reg carry_in;
	wire sum;
	wire carry_out;

	// 2. Instantiate the Unit Under Test (UUT) to map ports to declared local signals
	full_adder uut (
		.a(a),
		.b(b),
		.carry_in(carry_in),
		.sum(sum),
		.carry_out(carry_out)
	);

	// 3. Monitor values in console ($monitor: Automatically prints a new message to the console every time any of the listed variables change value.
	initial begin
		$monitor("Time=%0t | a=%b b=%b carry_in=%b | sum=%b carry_out=%b", $time, a, b, carry_in, sum, carry_out);
	end

	// 4. Generate conditions for the simulation
	initial begin
		$dumpfile("full_adder.vcd");
		$dumpvars(0, full_adder_tb);
	
		// Initialize inputs
		a = 0; b = 0; carry_in = 0;
		#10;

		// Loop through the remaining 7 states
		a = 0; b = 0; carry_in = 1; #10;
        	a = 0; b = 1; carry_in = 0; #10;
        	a = 0; b = 1; carry_in = 1; #10;
        	a = 1; b = 0; carry_in = 0; #10;
        	a = 1; b = 0; carry_in = 1; #10;
        	a = 1; b = 1; carry_in = 0; #10;
        	a = 1; b = 1; carry_in = 1; #10;
		
		// Stop simulation
		$finish;
	end

endmodule	
