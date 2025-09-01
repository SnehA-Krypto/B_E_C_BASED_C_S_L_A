module bec5 (input [4:0] din, output [4:0] dout);

    assign dout[0] = ~din[0];
    assign dout[1] = din[1] ^ din[0];
    assign dout[2] = din[2] ^ (din[1] & din[0]);
    assign dout[3] = din[3] ^ (din[2] & din[1] & din[0]);
    assign dout[4] = din[4] ^ (din[3] & din[2] & din[1] & din[0]);

endmodule


module bec6 (input [5:0] din, output [5:0] dout);

    assign dout[0] = ~din[0];
    assign dout[1] = din[1] ^ din[0];
    assign dout[2] = din[2] ^ (din[1] & din[0]);
    assign dout[3] = din[3] ^ (din[2] & din[1] & din[0]);
    assign dout[4] = din[4] ^ (din[3] & din[2] & din[1] & din[0]);
    assign dout[5] = din[5] ^ (din[4] & din[3] & din[2] & din[1] & din[0]);

endmodule


module bec7 (input [6:0] din, output [6:0] dout);

    assign dout[0] = ~din[0];
    assign dout[1] = din[1] ^ din[0];
    assign dout[2] = din[2] ^ (din[1] & din[0]);
    assign dout[3] = din[3] ^ (din[2] & din[1] & din[0]);
    assign dout[4] = din[4] ^ (din[3] & din[2] & din[1] & din[0]);
    assign dout[5] = din[5] ^ (din[4] & din[3] & din[2] & din[1] & din[0]);
    assign dout[6] = din[6] ^ (din[5] & din[4] & din[3] & din[2] & din[1] & din[0]);

endmodule


module bec8 (input [7:0] din, output [7:0] dout);

    assign dout[0] = ~din[0];
    assign dout[1] = din[1] ^ din[0];
    assign dout[2] = din[2] ^ (din[1] & din[0]);
    assign dout[3] = din[3] ^ (din[2] & din[1] & din[0]);
    assign dout[4] = din[4] ^ (din[3] & din[2] & din[1] & din[0]);
    assign dout[5] = din[5] ^ (din[4] & din[3] & din[2] & din[1] & din[0]);
    assign dout[6] = din[6] ^ (din[5] & din[4] & din[3] & din[2] & din[1] & din[0]);
    assign dout[7] = din[7] ^ (din[6] & din[5] & din[4] & din[3] & din[2] & din[1] & din[0]);

endmodule
