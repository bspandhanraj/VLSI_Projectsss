module t_ff (
    input wire t,      // Toggle input
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
            if (t) begin
                q <= ~q; // Toggle state if T is 1
            end else begin
                q <= q;  // Hold state if T is 0
            end
        end
    end

endmodule
