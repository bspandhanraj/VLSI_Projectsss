module tb_master_slave_jk;

    // Inputs
    reg j;
    reg k;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the Unit Under Test (UUT)
    master_slave_jk_ff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation (10 time units period)
    always #5 clk = ~clk;

    initial begin
        // Required for EDA Playground EPWave
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_master_slave_jk);

        // Initialize Inputs
        clk = 0;
        j = 0;
        k = 0;
        rst = 1;

        // Apply asynchronous reset
        #10 rst = 0;

        // Stimulus: Apply inputs on the falling edge so they are stable for the next rising edge
        #10 j = 1; k = 0; // Set: Master catches at 25, q becomes 1 at 30
        #10 j = 0; k = 0; // Hold: q remains 1
        #10 j = 0; k = 1; // Reset: Master catches at 45, q becomes 0 at 50
        
        // Testing the Toggle feature (j=1, k=1)
        #10 j = 1; k = 1; // Toggle: Master catches 1, q becomes 1
        #10 j = 1; k = 1; // Toggle: Master catches 0, q becomes 0
        #10 j = 1; k = 1; // Toggle: Master catches 1, q becomes 1
        
        #10 j = 0; k = 0; // Hold

        // Finish simulation
        #20 $finish;
    end

endmodule
