module tb_alu_4bit;

    reg [3:0] tb_A;
    reg [3:0] tb_B;
    reg [2:0] tb_ALU_Sel;
    wire [3:0] tb_ALU_Out;
    wire tb_CarryOut;

    // Instantiate the ALU
    alu_4bit dut (
        .A(tb_A),
        .B(tb_B),
        .ALU_Sel(tb_ALU_Sel),
        .ALU_Out(tb_ALU_Out),
        .CarryOut(tb_CarryOut)
    );

    // Variable for the loop
    integer i;

    initial begin
        $dumpfile("alu_sim.vcd"); 
        $dumpvars(0, tb_alu_4bit);
        
        $monitor("Time=%0t | Sel=%b | A=%d B=%d | Out=%d (Binary: %b) Carry=%b", 
                 $time, tb_ALU_Sel, tb_A, tb_B, tb_ALU_Out, tb_ALU_Out, tb_CarryOut);

        // Initialize inputs
        tb_A = 4'b1100; // Decimal 12
        tb_B = 4'b0100; // Decimal 4
        
        // Loop through all 8 ALU operations
        for (i = 0; i < 8; i = i + 1) begin
            tb_ALU_Sel = i; 
            #10; // Wait 10 time units
        end
        
        // Test an overflow addition case: 15 + 3 = 18 (Needs 5 bits, CarryOut should be 1)
        tb_A = 4'b1111; // Decimal 15
        tb_B = 4'b0011; // Decimal 3
        tb_ALU_Sel = 3'b000; // Addition
        #10;

        $finish;
    end

endmodule
