
module ripple_adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    assign {Cout, Sum} = A + B + Cin;

endmodule


module carry_select_adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [3:0] Sum0, Sum1;
    wire Cout0, Cout1;

    // First adder: Carry input = 0
    ripple_adder RCA0 (
        .A(A),
        .B(B),
        .Cin(1'b0),
        .Sum(Sum0),
        .Cout(Cout0)
    );

    // Second adder: Carry input = 1
    ripple_adder RCA1 (
        .A(A),
        .B(B),
        .Cin(1'b1),
        .Sum(Sum1),
        .Cout(Cout1)
    );

    // Multiplexer selects the correct result
    assign Sum  = Cin ? Sum1 : Sum0;
    assign Cout = Cin ? Cout1 : Cout0;

endmodule
