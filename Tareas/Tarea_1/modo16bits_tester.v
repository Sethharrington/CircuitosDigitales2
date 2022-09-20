module tester(clk, rst, enable, modo, d, q, rco);
    output reg clk , rst, enable;
    output reg [1:0] modo;
    output reg [15:0] d;
    input [15:0] q;
    input rco;

    wire rco_1, rco_2, rco_3;

initial begin
    $monitor ("clk=%b, rst=%b, enable=%b, modo=%b, d=%b, q=%b, rco=%b", clk, rst, enable, modo, d, q, rco);
    clk = 0;
    rst = 0;
    enable = 1;
    //Prueba #1 Cuentas ascendente
        modo = 3;
        d = 0;
        #4 modo = 0;
        #131072
    //Prueba #2 Cuentas descendente -1
        modo = 1;
        #2048
    //Prueba #4 Cuentas descendente -3
        modo = 3;
        #2048 d = 2048;
        #6 d = 4096;
        #6 d = 8192;
        #6 d = 16384;
        #6 d = 32768;

    //Prueba #3 Carga en paralelo
    modo = 2;
    #2048
    #4 $finish;
end

always begin
    #1 clk = !clk;
end
endmodule
