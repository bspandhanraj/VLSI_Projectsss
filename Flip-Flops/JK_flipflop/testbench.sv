module tb_jk_ff;

    // Inputs
    reg j;
    reg k;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the Unit Under Test (UUT)
    jk_ff uut (
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
        $dumpvars(1, tb_jk_ff);

        // Initialize Inputs
        clk = 0;
        j = 0;
        k = 0;
        rst = 1;

        // Apply asynchronous reset
        #10 rst = 0;

        // Stimulus: Testing all JK states
        #10 j = 0; k = 0; // Hold (q should be 0)
        #10 j = 1; k = 0; // Set (q becomes 1)
        #10 j = 0; k = 0; // Hold (q remains 1)
        #10 j = 0; k = 1; // Reset (q becomes 0)
        
        // Testing the Toggle feature (j=1, k=1)
        #10 j = 1; k = 1; // Toggle (q becomes 1)
        #10 j = 1; k = 1; // Toggle (q becomes 0)
        #10 j = 1; k = 1; // Toggle (q becomes 1)
        
        #10 j = 0; k = 0; // Hold (q remains 1)

        // Finish simulation
        #20 $finish;
    end

endmodule
