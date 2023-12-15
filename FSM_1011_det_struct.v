// Code your design here
module FSM_1011_det_model(input clk, x, rst, output detect_model);
  
  reg A,B,C;
  wire D_A, D_B, D_C;
  
  assign D_A = B & C & x;
  assign D_B = (C & ~x) | (B & ~C & x);
  assign D_A = (~B & x) | (~C & x);
  assign detect_model = A;
  
  always @(posedge clk)
    begin
      A <= rst? 1'b0 : D_A;
      B <= rst? 1'b0 : D_B;
      C <= rst? 1'b0 : D_C;
    end
  
endmodule
  
