// =============================================================================
// pl_alu.sv
// Unidade Logica e Aritmetica de 32 bits -- RV32I pipelined
//
// Codificacao de operacao (Operation[3:0]):
//   4'd01 : ADD  -- adicao com sinal
//   4'd02 : SUB  -- subtracao com sinal  (BEQ usa Zero)
//   4'd04 : OR   -- OU bit a bit
//   4'd05 : AND  -- E bit a bit
//   4'd11 : SLT  -- set-less-than com sinal
// =============================================================================

`timescale 1ns / 1ps

module pl_alu (
    input  logic [31:0] SrcA,
    input  logic [31:0] SrcB,
    input  logic [3:0]  Operation,
    output logic [31:0] ALUResult,
    output logic        Zero
);

    always_comb begin           
        case (Operation)
            4'd01: result = a + b;                                      // ADD
            4'd02: result = a - b;                                      // SUB
            4'd03: result = a ^ b;                                      // XOR  
            4'd04: result = a | b;                                      // OR
            4'd05: result = a & b;                                      // AND
            4'd06: result = a << b[4:0];                                // SLL  
            4'd08: result = a >> b[4:0];                                // SRL  
            4'd09: result = $signed(a) >>> b[4:0];                      // SRA  
            4'd11: result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;  // SLT
            4'd12: result = (a < b) ? 32'd1 : 32'd0;                    // SLTU 
            default: result = 32'd0;
        endcase
    end

    assign Zero = (ALUResult == 32'b0);

endmodule
