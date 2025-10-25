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
    output logic [DATA_WIDTH-1:0]   dout1,
    output logic [DATA_WIDTH-1:0]   dout2   
);

logic [ADDRESS_WIDTH-1:0] addr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (addr)
);

rom2ports rom (
    .clk (clk),
    .addr1 (addr),
    .addr2 (addr + v),
    .dout1 (dout1),
    .dout2 (dout2)
);

endmodule
