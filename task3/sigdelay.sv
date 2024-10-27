module sigdelay #(
    parameter       A_WIDTH = 9,
                    D_WIDTH = 8
)(
    //interface signals
    input logic             clk,
    input logic             rst,
    input logic             wr,
    input logic             rd,
    input logic             offset,
    input logic [D_WIDTH-1:0]   mic_signal,
    output logic [D_WIDTH-1:0]  delayed_signal
);

    logic [A_WIDTH-1:0]  wr_address;
    logic [A_WIDTH-1:0]  rd_address;

counter wr_addrCounter (
    .clk (clk),
    .rst (rst),
    .en (wr),
    .incr (1'b1),
    .count (wr_address)
);

always_ff @(posedge clk or posedge rst) begin
    if (rst) rd_address <= 0;
    else rd_address <= wr_address + offset;
end

ram2ports ram(
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (wr_address),
    .rd_addr (rd_address),
    .din (mic_signal),
    .dout (delayed_signal)
);
endmodule
