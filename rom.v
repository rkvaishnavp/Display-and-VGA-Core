module rom(pixdata, addr, clk);

output reg [11:0]pixdata;
input [20:0]addr;
input clk;

reg [11:0] romdata[0:307199];

initial begin
    $readmemb("image.bin",romdata);
end

always @(negedge clk ) begin
        pixdata <= romdata[addr];
end
endmodule