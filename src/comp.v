module comp(
    input [7:0] count1,
    input [7:0] count2,
    output reg[7:0] response
    );
   
    (* S= "TRUE"*)(* ALLOW_COMBINATORIAL_LOOPS = "true", KEEP = "true" *)
   
    always @(count1 or count2)
        begin
            if(&count1 > &count2)
                begin
                    response <= count1;
                end
            else
                begin
                    response <= count2;
                end
        end
endmodule
