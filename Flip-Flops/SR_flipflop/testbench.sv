module tb_sr_ff;

    // Inputs
    reg s;
    reg r;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the Unit Under Test (UUT)
    sr_ff uut (
        .s(s),
        .r(r),
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
        $dumpvars(1, tb_sr_ff);

        // Initialize Inputs
        clk = 0;
        s = 0;
        r = 0;
        rst = 1;

        // Apply reset
        #10 rst = 0;

        // Stimulus (Testing all states)
        #10 s = 0; r = 0; // Hold (q should be 0)
        #10 s = 0; r = 1; // Reset (q remains 0)
        #10 s = 0; r = 0; // Hold
        #10 s = 1; r = 0; // Set (q becomes 1)
        #10 s = 0; r = 0; // Hold (q remains 1)
        #10 s = 0; r = 1; // Reset (q becomes 0)
        #10 s = 1; r = 1; // Invalid state (q becomes x)
        #10 s = 0; r = 0; // Hold invalid

        // Finish simulation
        #20 $finish;
    end

endmodule
