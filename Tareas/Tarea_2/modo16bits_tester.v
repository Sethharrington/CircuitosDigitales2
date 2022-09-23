module tester(clk,
              rst,
              enable,
              modo,
              d,
              q,
              rco);
    output reg clk , rst, enable;
    output reg [1:0] modo;
    output reg [15:0] d;
    input [15:0] q;
    input rco;
    
    initial begin
        $monitor ("clk = %b, rst = %b, enable = %b, modo = %b, d = %b, q = %b, rco = %b", clk, rst, enable, modo, d, q, rco);
        clk            = 0;
        modo           = 0;
        enable         = 1;
        rst            = 1;
        #4 rst         = 0;
        d              = 0;
        //Prueba #1 Cuentas ascendente
        modo    = 3;
        #4 modo = 0;
        #2048 rst = 1;
        #4 rst =0;
        #20 enable = 0;
        #10 enable = 1;
        #131072
        #100
        //Prueba #2 Cuentas descendente -1
        modo = 1;
        #2048
        //Prueba #4 Cuentas descendente -3
        modo    = 3;
        #2048 d = 2048;
        #6 d    = 4096;
        #6 d    = 8192;
        #6 d    = 16384;
        #6 d    = 32768;
        
        //Prueba #3 Carga en paralelo
        modo = 2;
        #2048
        #4 $finish;
    end
    
    always begin
        #10 clk = !clk;
    end
endmodule
