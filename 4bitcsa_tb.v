

module tb_carry_select_adder;

    reg [3:0] A, B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    integer i, j, k;

    // Instantiate the DUT
    carry_select_adder DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $display("A     B     Cin   Sum   Cout");
        $display("--------------------------------");

        // Test all combinations
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin

                    A = i;
                    B = j;
                    Cin = k;

                    #10;

                    $display("%b  %b   %b    %b    %b",
                             A, B, Cin, Sum, Cout);

                    // Check correctness
                    if ({Cout, Sum} !== (A + B + Cin))
                        $display("ERROR: Test failed!");

                end
            end
        end

        $display("--------------------------------");
        $display("All 512 test cases completed.");

        $finish;
    end

endmodule
