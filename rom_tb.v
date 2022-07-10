module rom_tb;

wire[11:0]pixdata;
reg [20:0]addr;
reg clk;

rom rom1(pixdata, addr, clk);

always #1 clk <= ~clk;

initial begin
    $dumpfile("rom.vcd");
    $dumpvars(0,rom_tb);
    clk = 0;
    addr = 0;
    repeat(500000) begin
        #2  begin
            addr <= addr + 1;
        end
    end
    $finish;
end
endmodule