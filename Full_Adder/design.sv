module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    // Dataflow modeling for a Full Adder
    assign sum = a ^ b ^ cin; 
    assign cout = (a & b) | (cin & (a ^ b));

endmodule
