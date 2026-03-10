module alu_4bit (
    input [3:0] A,           // 4-bit Input A
    input [3:0] B,           // 4-bit Input B
    input [2:0] ALU_Sel,     // 3-bit Operation Selector (Opcode)
    output reg [3:0] ALU_Out,// 4-bit Output (Must be 'reg' since it's in an always block)
    output reg CarryOut      // 1-bit Carry Flag
);

    // Behavioral modeling: The block triggers whenever A, B, or ALU_Sel changes
    always @(*) begin
        // Default CarryOut to 0 to prevent latching
        CarryOut = 1'b0; 
        
        case(ALU_Sel)
            3'b000: begin 
                // Addition: We concatenate CarryOut and ALU_Out to capture the 5th bit
                {CarryOut, ALU_Out} = A + B; 
            end
            3'b001: ALU_Out = A - B;         // Subtraction
            3'b010: ALU_Out = A & B;         // Bitwise AND
            3'b011: ALU_Out = A | B;         // Bitwise OR
            3'b100: ALU_Out = A ^ B;         // Bitwise XOR
            3'b101: ALU_Out = ~(A | B);      // Bitwise NOR
            3'b110: ALU_Out = A << 1;        // Logical Shift Left (A by 1)
            3'b111: ALU_Out = A >> 1;        // Logical Shift Right (A by 1)
            default: ALU_Out = A + B; 
        endcase
    end

endmodule
