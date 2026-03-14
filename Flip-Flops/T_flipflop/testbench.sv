module tb_t_ff;

    // Inputs
    reg t;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the Unit Under Test (UUT)
    t_ff uut (
        .t(t),
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
        $dumpvars(1, tb_t_ff);

        // Initialize Inputs
        clk = 0;
        t = 0;
        rst = 1;

        // Apply asynchronous reset
        #10 rst = 0;

        // Stimulus: Testing Toggle and Hold modes
        #10 t = 0; // Hold (q remains 0)
        #10 t = 1; // Toggle (q becomes 1)
        #10 t = 1; // Toggle (q becomes 0)
        #10 t = 1; // Toggle (q becomes 1)
        #10 t = 0; // Hold (q remains 1)
        #10 t = 0; // Hold (q remains 1)
        #10 t = 1; // Toggle (q becomes 0)

        // Finish simulation
        #20 $finish;
    end

endmodule
