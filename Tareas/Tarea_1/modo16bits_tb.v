`include "modo16bits.v"
`include "modo16bits_tester.v"
//Testbench Code
module modo16bits_tb;
wire clk_tb, rst_tb, enable_tb, rco_tb;
wire [1:0] modo_tb;
wire [15:0] d, q;

MODO_16bit U1(
  .clk(clk_tb),
  .rst(rst_tb),
  .enable(enable_tb),
  .modo(modo_tb),
  .d(d),
  .q(q),
  .rco(rco_tb)
);

tester T1(
  .clk(clk_tb),
  .rst(rst_tb),
  .enable(enable_tb),
  .modo(modo_tb),
  .d(d),
  .q(q),
  .rco(rco_tb)
);

initial begin
  $dumpfile("resultados16.vcd");
  $dumpvars(-1, modo16bits_tb);
end
endmodule
