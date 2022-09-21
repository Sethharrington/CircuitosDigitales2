`include "modoContador.v"
//`include "modo_full_synth.v"
`include "cmos_cells.v"

module MODO_16bit(clk, rst, enable, modo, d, q, rco);
(* whitebox *)
  input clk , rst, enable;
  input [1:0] modo;
  input [15:0] d;
  output [15:0] q;
  output rco;

  wire rco_1, rco_2, rco_3;

MODO M0(
  .clk(clk),
  .rst(rst),
  .enable(enable),
  .modo(modo),
  .d(d[3:0]),
  .q(q[3:0]),
  .rco(rco_1)
);
MODO M1(
  .clk(rco_1),
  .rst(rst),
  .enable(enable),
  .modo(modo),
  .d(d[7:4]),
  .q(q[7:4]),
  .rco(rco_2)
);
MODO M2(
  .clk(rco_2),
  .rst(rst),
  .enable(enable),
  .modo(modo),
  .d(d[11:8]),
  .q(q[11:8]),
  .rco(rco_3)
);
MODO M3(
  .clk(rco_3),
  .rst(rst),
  .enable(enable),
  .modo(modo),
  .d(d[15:12]),
  .q(q[15:12]),
  .rco(rco)
);
endmodule