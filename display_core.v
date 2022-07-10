module display_core(red, green, blue, hsync, vsync, clk);

output reg [3:0] red, green, blue;
output reg hsync,vsync;
input clk;


reg [1:0]count = 2'b00;
reg pixclk=0;
reg[9:0] hcount=0, vcount=0;
reg[11:0] pixeldata [0:307199];

initial begin
$readmemb("image.bin",pixeldata);
end

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
    hcount <= hcount + 1;

    if(hcount == 800) begin
        hcount <= 0;
        if(vcount == 525) begin
            vcount <= 0;
        end
        else begin
            vcount <= vcount + 1;
        end
    end

    if(hcount < 706) begin
        hsync <= 1;
    end
    else begin
        hsync <= 0;
    end
    if(vcount < 524) begin
        vsync <= 1;
    end
    else begin
        vsync <= 0;
    end

    if(hcount > 48 && hcount < 690 && vcount > 33 && vcount < 514) begin
        red <= pixeldata[hcount - 48 + ((vcount-34)*525)][11:8];
        green <= pixeldata[hcount - 48 + ((vcount-34)*525)][7:4];
        blue <= pixeldata[hcount - 48 + ((vcount-34)*525)][3:0];
    end
    else begin
        red <= 0;
        green <= 0;
        blue <= 0;
    end
end
endmodule