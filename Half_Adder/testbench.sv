module tb_half_adder;

    reg tb_a, tb_b;
    wire tb_sum, tb_carry;

    // Connect the testbench to the Half-Adder
    half_adder dut (
        .a(tb_a),
        .b(tb_b),
        .sum(tb_sum),
        .carry(tb_carry)
    );

    initial begin
        // --- CUSTOMIZING YOUR WAVEFORM FILE NAME ---
        // Change "half_adder_sim.vcd" to whatever you want to name your file
        $dumpfile("half_adder_sim.vcd"); 
        $dumpvars(0, tb_half_adder);
        
        $monitor("Time=%0t | a=%b b=%b | Sum=%b Carry=%b", $time, tb_a, tb_b, tb_sum, tb_carry);

        // Truth Table Inputs
        tb_a = 0; tb_b = 0; #10;
        tb_a = 0; tb_b = 1; #10;
        tb_a = 1; tb_b = 0; #10;
        tb_a = 1; tb_b = 1; #10;
        
        $finish;
    end

endmodule
