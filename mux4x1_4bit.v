module mux4x1_4bit(
    input [3:0] A, B, C, D,
    input [1:0] Sel,
    
    input Enable,
    
    output [3:0] Y
);

    wire [3:0] picked;
    assign picked = (Sel == 2'b00) ? A:
                    (Sel == 2'b01) ? B:
                    (Sel == 2'b10) ? C: D;
                    
    assign Y = Enable ? picked : 4'b0000;
endmodule
