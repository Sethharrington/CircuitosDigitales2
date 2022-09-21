module modoTester (clk, rst, enable, modo, d, q, rco);

output reg clk, rst, enable;
output reg [1:0] modo;
output reg [3:0] d;
input [3:0] q;
input rco;

initial begin
    clk = 0;
    enable =1;
    rst = 0;
    //Prueba #1 Cuentas ascendente
      d = 0;
      modo = 3;
      #2 modo = 0;
      #2 enable = 0;
      #10 enable = 1;
      #36 rst = 1;
      #2 rst = 0;
    //Prueba #2 Cuentas descendente -1
      #66 modo = 1;
      #2 enable = 0;
      #10 enable = 1;
      #36 rst = 1;
      #2 rst = 0;
    //Prueba #3 Cuentas descendente -3
      #64 modo = 3;
      #6 d=14;
      modo = 2;
      #36 rst = 1;
      #2 rst = 0;
      #2 enable = 0;
      #4 enable = 1;
      #12 modo = 3;
    //Prueba #4 Carga en paralelo
      #2 d = 2;
      #2 d = 4;
      #2 enable = 0;
      #10 enable = 1;
      #2 d = 6;
      #2 d = 8;
      #2 d = 10;
      #2 rst = 1;
      #2 rst = 0;
      #2 d = 14;
      #2 d = 15;
    #4 $finish;
  end

  always begin
  #1 clk = !clk;
  end
endmodule