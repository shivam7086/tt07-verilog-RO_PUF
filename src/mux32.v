module mux32(
    input wire[7:1] i,
    input wire[4:0] sel,
    output reg m_out
    );
   
    (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
    always @(*)

    begin
    case(sel)
        5'b00000: m_out=i[1];
        5'b00001: m_out=i[2];
        5'b00010: m_out=i[3];
        5'b00011: m_out=i[4];
        5'b00100: m_out=i[5];
        5'b00101: m_out=i[6];
        5'b00110: m_out=i[7];
        5'b00111: m_out=i[8];
        5'b01000: m_out=i[9];
        5'b01001: m_out=i[10];
        5'b01010: m_out=i[11];
        5'b01011: m_out=i[12];
        5'b01100: m_out=i[13];
        5'b01101: m_out=i[14];
        5'b01110: m_out=i[15];
        5'b01111: m_out=i[16];
        5'b10000: m_out=i[17];
        5'b10001: m_out=i[18];
        5'b10010: m_out=i[19];
        5'b10011: m_out=i[20];
        5'b10100: m_out=i[21];
        5'b10101: m_out=i[22];
        5'b10110: m_out=i[23];
        5'b10111: m_out=i[24];
        5'b11000: m_out=i[25];
        5'b11001: m_out=i[26];
        5'b11010: m_out=i[27];
        5'b11011: m_out=i[28];
        5'b11100: m_out=i[29];
        5'b11101: m_out=i[30];
        5'b11110: m_out=i[31];
        5'b11111: m_out=i[32];
    endcase  
    end
endmodule
