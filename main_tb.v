`timescale 1ns/1ps

module main_tb;
    reg  [31:0] a, b;
    wire [31:0] sum;
    wire cout;

    // Instantiate DUT (main adder)
    main uut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("main.vcd");
        $dumpvars(0, main_tb);

        // Apply test vectors
        a = 32'h00000000; b = 32'h00000000; #10;
        a = 32'h56745675; b = 32'h54546576; #10;
        a = 32'hAB674594; b = 32'hAC784387; #10;
        a = 32'hFFFFFFFF; b = 32'h00000001; #10;

        $finish;
    end

    initial begin
        $monitor("T=%0t | a=%h b=%h | sum=%h cout=%b", $time, a, b, sum, cout);
    end
endmodule
