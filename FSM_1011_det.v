// Code your design here
module FSM_1011_det(input clk, x, rst, output detect);
  
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S10 = 3'b010;
  parameter S101 = 3'b011;
  parameter S1011 = 3'b100;
  
  reg [2:0] curr_state, next_state;
  assign detect = curr_state == S1011? 1: 0;
  always @ (posedge clk)
    begin
      if (rst)
        curr_state <= S0;
      else
        curr_state <= next_state;
    end
  always @ (*)
    begin
      case (curr_state)
        
        S0: begin
          next_state = x ? S1: S0;
        end
        
        S1: begin
          next_state = x ? S1: S10;
        end
        
        S10: begin
          next_state = x ? S101: S0;
        end
        
        S101: begin
          next_state = x ? S1011: S10;
        end
        
        S1011: begin
          next_state = x ? S1: S0;
        end
        
      endcase
    end
endmodule
  
