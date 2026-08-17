module mux_2to1_tb;

reg a, b, sel;
wire c;

mux_2to1 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .c(c)
);

initial begin
    $display("a b sel | c");

    // test case 1
    a = 0; b = 0; sel = 0;
    #1 $display("%b %b  %b  | %b", a, b, sel, c);

    // test case 2
    a = 0; b = 1; sel = 0;
    #1 $display("%b %b  %b  | %b", a, b, sel, c);

    // test case 3
    a = 0; b = 1; sel = 1;
    #1 $display("%b %b  %b  | %b", a, b, sel, c);

    // test case 4
    a = 1; b = 0; sel = 1;
    #1 $display("%b %b  %b  | %b", a, b, sel, c);

    $finish;
end

endmodule
