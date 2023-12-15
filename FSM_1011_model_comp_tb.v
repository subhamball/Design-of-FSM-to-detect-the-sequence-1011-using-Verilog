// Code your testbench here
// or browse Examples
module FSM_1011_model_tb;
  reg clk,x,rst;
  wire detect_model_fsm,detect_model_struct,comp;
  assign comp = detect_model_fsm === detect_model_struct;
  
  FSM_1011_det u0 (.clk(clk), .rst(rst), .x(x), .detect(detect_model_fsm));
  FSM_1011_det_model u0 (.clk(clk), .rst(rst), .x(x), .detect_model(detect_model_struct));
  
  always @(posedge clk) begin
    if (comp) begin
      $display("Output are matched");
    end
    else begin
      $display("Output  are not matched");
    end
  end
  
  initial begin
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor ("At time = %t, Out= %d",$time,detect_model);
    clk = 0;
    rst = 1;
    x = 0;
    
    #20 rst =0;
    
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    
    #20 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
