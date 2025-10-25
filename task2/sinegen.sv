module sinegen #(
    parameter   ADDRESS_WIDTH = 8,
                DATA_WIDTH = 8
)
(
    input logic                     clk,
    input logic                     rst,
    input logic                     en,
    input logic [DATA_WIDTH-1:0]    incr,
    input logic [DATA_WIDTH-1:0]    v, //vbdValue()
    output logic [DATA_WIDTH-1:0]   doutsin,
    output logic [DATA_WIDTH-1:0]   doutcos   
);

logic [ADDRESS_WIDTH-1:0] addr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (addr)
);

rom sineRom (
    .clk (clk),
    .addr (addr),
    .dout (doutsin)
);

rom cosineRom (
    .clk (clk),
    .addr (addr + v),
    .dout (doutcos)
);

endmodule
