module demux1x4_4bit(
    input [3:0] In,
    input [1:0] Sel,
    input Enable,
    
    output [3:0] Y0,
    output [3:0] Y1,
    output [3:0] Y2,
    output [3:0] Y3
);

    assign Y0 = (Enable && (Sel == 2'b00)) ? In : 4'b0000;
    assign Y1 = (Enable && (Sel == 2'b01)) ? In : 4'b0000;
    assign Y2 = (Enable && (Sel == 2'b10)) ? In : 4'b0000;
    assign Y3 = (Enable && (Sel == 2'b11)) ? In : 4'b0000;
endmodule
