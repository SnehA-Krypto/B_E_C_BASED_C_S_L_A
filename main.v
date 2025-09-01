`include "nbit_adder.v"   
`include "bec_modules.v"  
`include "muxNbit.v"   

module main (
    input  [31:0] a, b,
    output [31:0] sum,
    output cout
);

    wire [4:0] sel_carry;
    
    wire [3:0]  s0;
    wire [4:0]  t0, t0_next;
    wire [4:0]  s1;
    wire [5:0]  t1, t1_next;
    wire [5:0]  s2;
    wire [6:0]  t2, t2_next;
    wire [6:0]  s3;
    wire [7:0]  t3, t3_next;
    wire [6:0]  s4;
    wire [7:0]  t4, t4_next;

    wire c0, c1, c2, c3, c4;

    // block1: 3-bit RCA
    nbit_adder #(3) blk1 (.a(a[2:0]), .b(b[2:0]), .cin(1'b0), .sum(sum[2:0]), .cout(sel_carry[0]));

    // block2: 4-bit RCA + BEC5
    nbit_adder #(4) blk2 (.a(a[6:3]), .b(b[6:3]), .cin(1'b0), .sum(s0), .cout(c0));
    assign t0 = {c0, s0};
    bec5 inc1 (.din(t0), .dout(t0_next));

    muxNbit #(4) mux1 (.data_out(sum[6:3]), .a(t0[3:0]), .b(t0_next[3:0]), .sel(sel_carry[0]));
    muxNbit #(1) mux2 (.data_out(sel_carry[1]), .a(t0[4]), .b(t0_next[4]), .sel(sel_carry[0]));

    // block3: 5-bit RCA + BEC6
    nbit_adder #(5) blk3 (.a(a[11:7]), .b(b[11:7]), .cin(1'b0), .sum(s1), .cout(c1));
    assign t1 = {c1, s1};
    bec6 inc2 (.din(t1), .dout(t1_next));

    muxNbit #(5) mux3 (.data_out(sum[11:7]), .a(t1[4:0]), .b(t1_next[4:0]), .sel(sel_carry[1]));
    muxNbit #(1) mux4 (.data_out(sel_carry[2]), .a(t1[5]), .b(t1_next[5]), .sel(sel_carry[1]));

    // block4: 6-bit RCA + BEC7
    nbit_adder #(6) blk4 (.a(a[17:12]), .b(b[17:12]), .cin(1'b0), .sum(s2), .cout(c2));
    assign t2 = {c2, s2};
    bec7 inc3 (.din(t2), .dout(t2_next));

    muxNbit #(6) mux5 (.data_out(sum[17:12]), .a(t2[5:0]), .b(t2_next[5:0]), .sel(sel_carry[2]));
    muxNbit #(1) mux6 (.data_out(sel_carry[3]), .a(t2[6]), .b(t2_next[6]), .sel(sel_carry[2]));

    // block5: 7-bit RCA + BEC8
    nbit_adder #(7) blk5 (.a(a[24:18]), .b(b[24:18]), .cin(1'b0), .sum(s3), .cout(c3));
    assign t3 = {c3, s3};
    bec8 inc4 (.din(t3), .dout(t3_next));

    muxNbit #(7) mux7 (.data_out(sum[24:18]), .a(t3[6:0]), .b(t3_next[6:0]), .sel(sel_carry[3]));
    muxNbit #(1) mux8 (.data_out(sel_carry[4]), .a(t3[7]), .b(t3_next[7]), .sel(sel_carry[3]));

    // block6: 7-bit RCA + BEC8
    nbit_adder #(7) blk6 (.a(a[31:25]), .b(b[31:25]), .cin(1'b0), .sum(s4), .cout(c4));
    assign t4 = {c4, s4};
    bec8 inc5 (.din(t4), .dout(t4_next));

    muxNbit #(7) mux9  (.data_out(sum[31:25]), .a(t4[6:0]), .b(t4_next[6:0]), .sel(sel_carry[4]));
    muxNbit #(1) mux10 (.data_out(cout),        .a(t4[7]),   .b(t4_next[7]),   .sel(sel_carry[4]));

endmodule
