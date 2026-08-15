// MUX 2:1
module mux (
    output logic f,
    input  logic a, b, sel
);
    logic f1, f2, n_sel;

    not (n_sel, sel);
    and (f1, a, n_sel),
        (f2, b, sel);
    or  (f, f1, f2);
endmodule

// MUX 4:1 de 32 bits
module mux4_32bit (
    output logic [31:0] f,
    input  logic [31:0] a, b, c, d,
    input  logic [1:0]  sel
);
    logic [31:0] ab, cd;

    // Seleciona entre (a,b) e (c,d) nos 32 bits
    mux m_ab [31:0] (.f(ab), .a(a),  .b(b),  .sel(sel[0]));
    mux m_cd [31:0] (.f(cd), .a(c),  .b(d),  .sel(sel[0]));

    // Seleciona o resultado final
    mux m_out[31:0] (.f(f),  .a(ab), .b(cd), .sel(sel[1]));
endmodule