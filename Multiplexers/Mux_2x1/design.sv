module mux_2x1 (
    input d0,      // Data input 0
    input d1,      // Data input 1
    input sel,     // Selection line
    output y       // Output
);

    // If sel is 1, y gets d1. If sel is 0, y gets d0.
    assign y = sel ? d1 : d0; 

endmodule
