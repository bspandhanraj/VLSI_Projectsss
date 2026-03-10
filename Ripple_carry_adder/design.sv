// 4-bit Ripple Carry Adder Module
module ripple_carry_adder (
    input [3:0] A,      // 4-bit input A
    input [3:0] B,      // 4-bit input B
    input Cin,          // 1-bit Carry Input
    output [3:0] Sum,   // 4-bit Sum output
    output Cout         // 1-bit Carry Output
);

    // Internal wires to connect the carry-out of one adder to the carry-in of the next
    wire c1, c2, c3; 

    // Instantiate 4 Full Adders and wire them together (Structural Modeling)
    // Format: full_adder instance_name (a, b, cin, sum, cout);
    full_adder fa0 (A[0], B[0], Cin, Sum[0], c1);
    full_adder fa1 (A[1], B[1], c1,  Sum[1], c2);
    full_adder fa2 (A[2], B[2], c2,  Sum[2], c3);
    full_adder fa3 (A[3], B[3], c3,  Sum[3], Cout);

endmodule

// --- PASTE YOUR FULL ADDER MODULE HERE SO THE RCA CAN USE IT ---
module full_adder (
    input a, input b, input cin, output sum, output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
