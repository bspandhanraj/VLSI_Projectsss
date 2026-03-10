module tb_full_adder;

    // Inputs
    reg tb_a, tb_b, tb_cin;
    // Outputs
    wire tb_sum, tb_cout;

    // Instantiate the Full Adder
    full_adder dut (
        .a(tb_a),
        .b(tb_b),
        .cin(tb_cin),
        .sum(tb_sum),
        .cout(tb_cout)
    );

    initial begin
        // Generate the VCD file for EPWave/GTKWave
        $dumpfile("full_adder_sim.vcd"); 
        $dumpvars(0, tb_full_adder);
        
        // Print truth table to the console
        $monitor("Time=%0t | a=%b b=%b cin=%b | Sum=%b Cout=%b", 
                 $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);

        // Apply stimulus (8 combinations)
        tb_a=0; tb_b=0; tb_cin=0; #10;
        tb_a=0; tb_b=0; tb_cin=1; #10;
        tb_a=0; tb_b=1; tb_cin=0; #10;
        tb_a=0; tb_b=1; tb_cin=1; #10;
        tb_a=1; tb_b=0; tb_cin=0; #10;
        tb_a=1; tb_b=0; tb_cin=1; #10;
        tb_a=1; tb_b=1; tb_cin=0; #10;
        tb_a=1; tb_b=1; tb_cin=1; #10;
        
        $finish;
    end

endmodule
