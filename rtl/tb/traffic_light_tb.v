`timescale 1ns/1ps

module tb;

reg clk;
reg rst;

wire NS_R;
wire NS_Y;
wire NS_G;

wire EW_R;
wire EW_Y;
wire EW_G;

traffic_light_controller uut(
    .clk(clk),
    .rst(rst),
    .NS_R(NS_R),
    .NS_Y(NS_Y),
    .NS_G(NS_G),
    .EW_R(EW_R),
    .EW_Y(EW_Y),
    .EW_G(EW_G)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #300;

    $finish;
end

// Waveform
initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
end

endmodule
