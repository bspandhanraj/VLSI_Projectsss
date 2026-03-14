module jk_ff (
    input wire j,      // J input (Set)
    input wire k,      // K input (Reset)
    input wire clk,    // Clock input
    input wire rst,    // Asynchronous active-high reset
    output reg q,      // Output
    output wire q_bar  // Inverted output
);

    // q_bar is always the logical inverse of q
    assign q_bar = ~q;

    // Trigger on the rising edge of the clock or rising edge of reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0; // Reset state
        end else begin
            case ({j, k})
                2'b00: q <= q;       // Hold current state
                2'b01: q <= 1'b0;    // Reset (q = 0)
                2'b10: q <= 1'b1;    // Set (q = 1)
                2'b11: q <= ~q;      // Toggle (invert current state)
            endcase
        end
    end

endmodule
