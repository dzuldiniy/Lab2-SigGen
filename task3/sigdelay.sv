module sigdelay #(
    parameter   ADDRESS_WIDTH = 9,
                DATA_WIDTH = 8
)
(
    input logic                     clk,
    input logic                     rst,
    input logic                     wr,
    input logic                     rd,
    input logic [ADDRESS_WIDTH-1:0]     incr,
    input logic [ADDRESS_WIDTH-1:0] offset, //vbdValue()
    input logic [DATA_WIDTH-1:0]    mic_signal, //vbdValue()
    output logic [DATA_WIDTH-1:0]   delayed_signal 
);

logic [ADDRESS_WIDTH-1:0] addr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (wr),
    .incr (incr),
    .count (addr)
);

ram2ports ram (
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (addr),
    .rd_addr (addr - offset),
    .din (mic_signal),
    .dout (delayed_signal)
);

endmodule
