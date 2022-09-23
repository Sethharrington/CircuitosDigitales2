module
    MODO (clk,
    rst,
    enable,
    modo,
    d,
    q,
    rco);
    input clk, rst, enable;
    input [1:0] modo;
    input [3:0] d;
    output reg [3:0] q;
    output reg rco;
    
    always @(*) begin
        if (rst) begin
            rco <= 0;
            case (modo)
                2'b00: q <= 4'b0;
                2'b01: q <= 4'b1111;
                2'b10: q <= 4'b1111;
                2'b11: begin
                    q   <= 4'bXXXX;
                    rco <= clk;
                end
            endcase
        end
    end
    always @(posedge clk) begin
        if (rst) rco = 0;
        else if (enable) begin
            case (modo)
                0: begin
                    rco <= (q > 14) ? 1 : 0;
                    q   <= (q + 1);
                end
                1: if (q > 0) q <= (q - 1);
                else begin
                    q   <= 15;
                    rco <= 1;
                end
                2: if (q > 2) q <= (q - 3);
                else begin
                    case (q)
                        0: q <= 12;
                        1: q <= 13;
                        2: q <= 14;
                    endcase
                    rco <= 1;
                end
                3: begin
                    q   <= d;
                    rco <= clk;
                end
            endcase
        end
    end
endmodule
