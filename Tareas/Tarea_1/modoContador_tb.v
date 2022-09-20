`include "modoContador.v"
`include "modoContador_tester.v"
//Testbench Code
module counter_tb;

wire clk, rst, enable;
wire [1:0] modo;
wire [3:0] d;
wire [3:0] q;
wire rco;

MODO U1(
  .clk(clk),
  .rst(rst),
  .enable(enable),
  .modo(modo),
  .d(d),
  .q(q),
  .rco(rco)
);

modoTester T1(
  .clk(clk),
  .rst(rst),
  .enable(enable),
  .modo(modo),
  .d(d),
  .q(q),
  .rco(rco)
);

initial begin
  $dumpfile("resultados.vcd");
  $dumpvars(-1, U1);
  $monitor ("clk=%b, rst=%b, enable=%b, modo=%b, d=%b, q=%b, rco=%b", clk, rst, enable, modo, d, q, rco);
  //$monitor("b", q);
end
endmodule
