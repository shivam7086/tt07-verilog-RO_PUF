module counter(
    input m_out,
    input reset,
    output reg[7:0] count
    );
   
    (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
    initial count=7'h00;
    always @(posedge m_out or posedge reset)
    begin
        if(reset)
            begin
                count = 0;
            end
        else
            begin
                count = count + 1;
            end
    end
endmodule
