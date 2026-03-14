module tb_d_ff;

    // Inputs
    reg d;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the Unit Under Test (UUT)
    d_ff uut (
        .d(d),
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
        $dumpvars(1, tb_d_ff);

        // Initialize Inputs
        clk = 0;
        d = 0;
        rst = 1;

        // Apply asynchronous reset
        #10 rst = 0;

        // Stimulus: Testing data capture on clock edges
        #10 d = 1; // q becomes 1 on next posedge
        #10 d = 0; // q becomes 0 on next posedge
        #15 d = 1; // Change d halfway through clock cycle
        #15 d = 0; // Change d again
        #10 d = 1; 

        // Finish simulation
        #20 $finish;
    end

endmodule
