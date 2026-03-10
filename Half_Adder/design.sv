module half_adder (
    input a,
    input b,
    output sum,
    output carry
);

    // The logic for a Half-Adder
    assign sum = a ^ b;   // XOR gate for the Sum
    assign carry = a & b; // AND gate for the Carry

endmodule
