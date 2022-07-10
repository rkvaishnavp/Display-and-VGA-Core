module display_vga_core_tb;

wire hsync,vsync;
wire [3:0] red,green,blue;
reg clk;
reg hsync1,vsync1;
reg [3:0] red1,green1,blue1;

assign hsync1 = hsync;
assign vsync1 = vsync;
assign red1 = red;
assign green1 = green;
assign blue1 = blue;

display_core display_core1(red, green, blue, hsync, vsync, clk);
vga vga1(red1, green1, blue1, hsync1, vsync1, clk);

initial begin
    repeat(1000000) begin
        $dumpfile("display_vga_core.vcd");
        $dumpvars(0,display_vga_core_tb);
        #1 clk = ~clk;
    end
end
endmodule