
module carry_select_adder_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input        Cin,
    output [7:0] Sum,
    output       Cout
);

    wire C4;
    wire [4:0] sum0, sum1;

    // Lower 4-bit adder
    assign {C4, Sum[3:0]} = A[3:0] + B[3:0] + Cin;

    // Upper 4-bit adder assuming carry-in = 0
    assign sum0 = A[7:4] + B[7:4];

    // Upper 4-bit adder assuming carry-in = 1
    assign sum1 = A[7:4] + B[7:4] + 1'b1;

    // Multiplexer selects correct upper result
    assign {Cout, Sum[7:4]} = C4 ? sum1 : sum0;

endmodule
