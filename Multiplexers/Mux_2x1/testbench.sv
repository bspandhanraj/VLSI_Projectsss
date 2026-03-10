module tb_mux_2x1;

    reg tb_d0;
    reg tb_d1;
    reg tb_sel;
    wire tb_y;

    // Instantiate the 2x1 MUX
    mux_2x1 dut (
        .d0(tb_d0),
        .d1(tb_d1),
        .sel(tb_sel),
        .y(tb_y)
    );

    initial begin
        $dumpfile("mux_2x1_sim.vcd"); 
        $dumpvars(0, tb_mux_2x1);
        
        $monitor("Time=%0t | sel=%b | d1=%b d0=%b | y=%b", 
                 $time, tb_sel, tb_d1, tb_d0, tb_y);

        // Test Case 1: sel = 0, y should follow d0
        tb_sel = 0; tb_d1 = 0; tb_d0 = 0; #10; // y should be 0
        tb_sel = 0; tb_d1 = 1; tb_d0 = 1; #10; // y should be 1

        // Test Case 2: sel = 1, y should follow d1
        tb_sel = 1; tb_d1 = 0; tb_d0 = 1; #10; // y should be 0
        tb_sel = 1; tb_d1 = 1; tb_d0 = 0; #10; // y should be 1
        
        $finish;
    end

endmodule
