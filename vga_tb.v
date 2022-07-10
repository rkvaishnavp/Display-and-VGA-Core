module vga_tb;

reg hsync, vsync, clk;
reg[3:0] red, green, blue;

vga vga1(red, green, blue, hsync, vsync, clk);

initial begin
    $dumpfile("vga.vcd");
    $dumpvars(0,vga_tb);
    red = 0;
    green = 1;
    blue = 0;
    hsync = 1;
    vsync = 1;
    clk = 0;
    repeat(1000000) begin
        #1 clk = ~clk;
    end
end
endmodule