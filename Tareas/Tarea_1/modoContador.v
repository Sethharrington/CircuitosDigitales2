module MODO (clk, rst, enable, modo, d, q, rco);

input clk, rst, enable;
input [1:0] modo;
input [3:0] d;
output reg [3:0] q;
output reg rco;

always @ (posedge clk or posedge rst or posedge enable or d) begin
  if (rco !== 1) rco <= 0;
  if (rst) begin 
    rco <= 0;
    case (modo)
      0: q <= 0; 
      1: q <= 15;
      2: q <= 15; 
      3: q <= 4'bXXXX; endcase
  end else begin
    while (enable) begin
      case (modo)
        0: if(rco) q = rco;
          else if (q < 15) q <= (q + 1); 
          else begin
            q <=0;
            rco <= 1; end
        1: if (q > 0) q <= (q - 1); 
          else begin
            q <=15;
            rco <= 1; end
        2: if (q > 2) q <= (q - 3); 
          else begin
            case (q)
              0: q <= 12;
              1: q <= 13;
              2: q <=14; endcase
          rco <= 1; end 
        3: q <= d;
      endcase
      if (rco == 1) rco = 0;
    end
  end
end
endmodule