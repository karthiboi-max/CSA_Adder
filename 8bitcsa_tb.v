

module tb_carry_select_adder_8bit;

    reg [7:0] A, B;
    reg Cin;

    wire [7:0] Sum;
    wire Cout;

    reg [8:0] expected;

    integer i, j, k;
    integer errors;

    // Instantiate DUT
    carry_select_adder_8bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        errors = 0;

        $display("====================================");
        $display(" 8-BIT CARRY SELECT ADDER TESTBENCH");
        $display("====================================");

        for (k = 0; k < 2; k = k + 1) begin
            for (i = 0; i < 256; i = i + 1) begin
                for (j = 0; j < 256; j = j + 1) begin

                    A = i;
                    B = j;
                    Cin = k;

                    #10;

                    expected = A + B + Cin;

                    if ({Cout, Sum} !== expected) begin
                        errors = errors + 1;

                        $display("FAIL: A=%d B=%d Cin=%b",
                                 A, B, Cin);

                        $display("Expected=%b Actual=%b",
                                 expected, {Cout,Sum});
                    end

                end
            end
        end

        $display("------------------------------------");

        if (errors == 0)
            $display("ALL TEST CASES PASSED!");
        else
            $display("TEST FAILED! Errors = %d", errors);

        $display("====================================");

        $finish;

    end

endmodule
