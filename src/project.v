/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_PUF (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = uo_out + uio_out;  // Example: ou_out is the sum of ui_in and uio_in
  // assign uio_out = 0;
  assign uio_oe  = 0;
//module Top (output [7:0] ui_out, input ena, rst_n, input [4:0] ui_in);
    wire [15:0] count1, count2;
    top_f2g uut1(count1, ena, rst_n, ui_in[4:0]);
    top_f2g uut2(count2, ena, rst_n, ui_in[4:0]);
    comp uut3(count1, count2, uo_out);
endmodule

module f2g (output p, q, r, input a, b, c);
assign p=a;
assign q=a^b;
assign r=a^c;  
endmodule

    module osc_f2g (output out, input ena);
wire [4:0] p, q, r;
wire A;
f2g g0(p[0], q[0], r[0], A, 1'b1, 1'b1);
f2g g1(p[1], q[1], r[1], r[0], 1'b1, 1'b1);
f2g g2(p[2], q[2], r[2], q[1], 1'b1, 1'b1);
f2g g3(p[3], q[3], r[3], r[2], 1'b1, 1'b1);
f2g g4(p[4], q[4], r[4], q[3], 1'b1, 1'b1);
        and a0(out, ena, r[4]);
assign A=out;
endmodule

module top_f2g (output [15:0] count, input ena, rst_n, input [4:0] ui_in); // make change input [4:0]
    wire [15:0] i;
wire mux_out;
genvar x;     
generate
    for(x=0; x<16; x=x+1)
    begin
        (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
        osc_f2g f0(i[x], ena);
    end
endgenerate

mux32 uut(i, ui_in, mux_out);

        counter c(mux_out, rst_n, count);  
endmodule

module mux32(
    input wire[16:1] i,
    input wire[4:0] ui_in,
    output reg m_out
    );
   
    (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
    always @(*)

    begin
    case(ui_in)
        4'b0000: m_out=i[1];
        4'b0001: m_out=i[2];
        4'b0010: m_out=i[3];
        5'b0011: m_out=i[4];
        4'b0100: m_out=i[5];
        4'b0101: m_out=i[6];
        4'b0110: m_out=i[7];
        4'b0111: m_out=i[8];
        4'b1000: m_out=i[9];
        4'b1001: m_out=i[10];
        4'b1010: m_out=i[11];
        4'b1011: m_out=i[12];
        4'b1100: m_out=i[13];
        4'b1101: m_out=i[14];
        4'b1110: m_out=i[15];
        'b1111: m_out=i[16];
       // 5'b10000: m_out=i[17];
       // 5'b10001: m_out=i[18];
       // 5'b10010: m_out=i[19];
       //  5'b10011: m_out=i[20];
       //  5'b10100: m_out=i[21];
       //  5'b10101: m_out=i[22];
       //  5'b10110: m_out=i[23];
       //  5'b10111: m_out=i[24];
       //  5'b11000: m_out=i[25];
       //  5'b11001: m_out=i[26];
       //  5'b11010: m_out=i[27];
       //  5'b11011: m_out=i[28];
       //  5'b11100: m_out=i[29];
       //  5'b11101: m_out=i[30];
       //  5'b11110: m_out=i[31];
       //  5'b11111: m_out=i[32];
    endcase  
    end
endmodule

module counter(
    input m_out,
    input rst_n,
    output reg[15:0] count
    );
   
    (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
    initial count=15'h0000;
    always @(posedge m_out or posedge rst_n)
    begin
        if(rst_n)
            begin
                count = 0;
            end
        else
            begin
                count = count + 1;
            end
    end
endmodule

module comp(
    input [15:0] count1,
    input [15:0] count2,
    output reg[15:0] uo_out
   
  
    );
   
    (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
   
    always @(count1 or count2)
        begin
            if(&count1 > &count2)
                begin
                    uo_out <= count1;
                end
            else
                begin
                    uo_out <= count2;
                end
        end
        
endmodule
