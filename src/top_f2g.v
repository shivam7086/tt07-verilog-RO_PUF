module top_f2g (output [7:0] count, input en, reset, input [4:0] sel);
wire [7:0] i;
wire mux_out;
genvar x;
generate
    for(x=0; x<7; x=x+1)
    begin
        (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
        osc_f2g f0(i[x], en);
    end
endgenerate

mux32 uut(i, sel, mux_out);

counter c(mux_out, reset, count);  
endmodule
