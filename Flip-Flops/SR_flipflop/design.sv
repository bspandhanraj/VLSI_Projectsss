module sr_ff (
    input wire s,      // Set input
    input wire r,      // Reset input
    input wire clk,    // Clock input
    input wire rst,    // Asynchronous reset
    output reg q,      // Output
    output wire q_bar  // Inverted output
);

    // q_bar is always the inverse of q
    assign q_bar = ~q;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0; // Reset state
        end else begin
            case ({s, r})
                2'b00: q <= q;       // Hold current state
                2'b01: q <= 1'b0;    // Reset (q = 0)
                2'b10: q <= 1'b1;    // Set (q = 1)
                2'b11: q <= 1'bx;    // Invalid/Restricted state
            endcase
        end
    end

endmodule
