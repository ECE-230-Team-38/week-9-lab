module top(
    input [15:0] sw,
    input btnL, btnU, btnD, btnR, btnC,
    
    output [15:0] led
);

    wire [3:0] CEO = sw [3:0];
    wire [3:0] YOU = sw [7:4];
    wire [3:0] FRED = sw [11:8];
    wire [3:0] JILL = sw [15:12];
    
    wire [1:0] mux_sel = {btnU, btnL};
    wire [1:0] demux_sel = {btnR, btnD};
    
    wire [3:0] bus_to_outs;
    
    mux4x1_4bit u_mux (
        .A(CEO),
        .B(YOU),
        .C(FRED),
        .D(JILL),
        .Sel(mux_sel),
        .Enable(btnC),
        .Y(bus_to_outs)
    );
    
    wire [3:0] local_lib, fire_dept, school, rib_shack;
    
    demux1x4_4bit u_demux (
        .In(bus_to_outs),
        .Sel(demux_sel),
        .Enable(btnC),
        .Y0(local_lib),
        .Y1(fire_dept),
        .Y2(school),
        .Y3(rib_shack)
    );
    
    assign led[3:0] = local_lib;
    assign led[7:4] = fire_dept;
    assign led[11:8] = school;
    assign led[15:12] = rib_shack;
    
    
endmodule
