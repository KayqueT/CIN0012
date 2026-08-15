`timescale 1ns/1ps

module tb_mux4_32bit;

    logic [31:0] a, b, c, d, f;
    logic [1:0]  sel;

    mux4_32bit dut (.f(f), .a(a), .b(b), .c(c), .d(d), .sel(sel));

    initial begin
        a = 32'hAAAA_AAAA;
        b = 32'h5555_5555;
        c = 32'hFFFF_0000;
        d = 32'h0000_FFFF;

	$monitor($time, " | sel=%b (%0d) | f=%h", sel, sel, f);

        for (int i = 0; i < 4; i++) begin
            sel = i[1:0];
            #10;
        end

        $stop;
    end

endmodule: tb_mux4_32bit
