module vga(red, green, blue, hsync, vsync, clk);

input[3:0] red, green, blue;
input hsync, vsync, clk;

reg [1:0]count = 2'b00;
reg pixclk=0;
reg[9:0] pixcount=0;

always @(posedge clk ) begin
    count <= count + 2'b01;
    if(count == 2'b10) begin
        pixclk <= ~pixclk;
    end
    else if(count == 2'b11) begin
        count <= 2'b00;
        pixclk <= ~pixclk;
    end
end

always @(posedge pixclk ) begin
    pixcount <= pixcount + 1;
    if(hsync == 1 && vsync ==1) begin
        if(pixcount > 48 && pixcount < 690) begin
            $display("  %d  %d  %d",red,green,blue);
        end
    end
    if (pixcount == 800) begin
        pixcount = 0;
    end
end

endmodule