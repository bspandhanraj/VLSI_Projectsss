module tb_ripple_carry_adder;

    reg [3:0] tb_A;
    reg [3:0] tb_B;
    reg tb_Cin;
    wire [3:0] tb_Sum;
    wire tb_Cout;

    // Connect the testbench to the RCA
    ripple_carry_adder dut (
        .A(tb_A),
        .B(tb_B),
        .Cin(tb_Cin),
        .Sum(tb_Sum),
        .Cout(tb_Cout)
    );

    initial begin
        $dumpfile("rca_sim.vcd"); 
        $dumpvars(0, tb_ripple_carry_adder);
        
        // %d prints the values as decimal numbers for easier reading
        $monitor("Time=%0t | A=%d B=%d Cin=%b | Sum=%d Cout=%b", 
                 $time, tb_A, tb_B, tb_Cin, tb_Sum, tb_Cout);

        // Apply arithmetic test cases
        tb_A = 4'b0000; tb_B = 4'b0000; tb_Cin = 0; #10; // 0 + 0 = 0
        tb_A = 4'b0101; tb_B = 4'b0011; tb_Cin = 0; #10; // 5 + 3 = 8
        tb_A = 4'b0111; tb_B = 4'b0111; tb_Cin = 0; #10; // 7 + 7 = 14
        
        // Testing overflow (Carry Out)
        tb_A = 4'b1111; tb_B = 4'b0001; tb_Cin = 0; #10; // 15 + 1 = 16 (Sum=0, Cout=1)
        tb_A = 4'b1010; tb_B = 4'b0101; tb_Cin = 1; #10; // 10 + 5 + 1 = 16 (Sum=0, Cout=1)
        tb_A = 4'b1111; tb_B = 4'b1111; tb_Cin = 1; #10; // 15 + 15 + 1 = 31 (Sum=15, Cout=1)
        
        $finish;
    end

endmodule
