module osc_f2g (output out, input en);
wire [4:0] p, q, r;
wire A;
f2g g0(p[0], q[0], r[0], A, 1'b1, 1'b1);
f2g g1(p[1], q[1], r[1], r[0], 1'b1, 1'b1);
f2g g2(p[2], q[2], r[2], q[1], 1'b1, 1'b1);
f2g g3(p[3], q[3], r[3], r[2], 1'b1, 1'b1);
f2g g4(p[4], q[4], r[4], q[3], 1'b1, 1'b1);
and a0(out, en, r[4]);
assign A=out;
endmodule
