module nbit_adder #(parameter SIZE = 2) (
    input  [SIZE-1:0] a, b,
    input  cin,
    output [SIZE-1:0] sum,
    output cout
);

    wire [SIZE:0] result;

    assign result = a + b + cin;
    assign sum    = result[SIZE-1:0];
    assign cout   = result[SIZE];

endmodule
