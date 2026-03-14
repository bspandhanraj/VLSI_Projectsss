module master_slave_jk_ff (
    input wire j,      // J input
    input wire k,      // K input
    input wire clk,    // Clock input
    input wire rst,    // Asynchronous active-high reset
    output reg q,      // Slave Output (Final Output)
    output wire q_bar  // Inverted Output
);

    // Internal register to hold the Master's state
    reg master_q;

    // The inverted output is always the opposite of the final slave output
    assign q_bar = ~q;

    // --------------------------------------------------------
    // MASTER STAGE: Catches inputs on the RISING edge of clock
    // --------------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            master_q <= 1'b0;
        end else begin
            case ({j, k})
                2'b00: master_q <= q;       // Hold (uses feedback from Slave)
                2'b01: master_q <= 1'b0;    // Reset
                2'b10: master_q <= 1'b1;    // Set
                2'b11: master_q <= ~q;      // Toggle (uses feedback from Slave)
            endcase
        end
    end

    // --------------------------------------------------------
    // SLAVE STAGE: Updates output on the FALLING edge of clock
    // --------------------------------------------------------
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;
        end else begin
            q <= master_q; // Transfer Master's captured state to Slave's output
        end
    end

endmodule
