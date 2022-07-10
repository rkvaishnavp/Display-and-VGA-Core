module display_core_tb;

wire [3:0] red, green, blue;
wire hsync, vsync;
reg clk;

display_core display_core1(red, green, blue, hsync, vsync, clk);

initial begin
    $dumpfile("display_core.vcd");
    $dumpvars(0,display_core_tb);
    clk = 0;
    repeat(10000000) begin
        #1 clk = ~clk;
    end
end
endmodule