module muxNbit #(parameter WIDTH = 5) (
    output [WIDTH-1:0] data_out,
    input  wire [WIDTH-1:0] a, b,
    input  wire sel
);

assign data_out = (sel) ? b : a;

endmodule
