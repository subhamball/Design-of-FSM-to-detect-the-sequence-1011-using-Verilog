// Code your testbench here
// or browse Examples
module FSM_1011_tb;
  reg clk,x,rst;
  wire detect;
  
  FSM_1011_det u0 (.clk(clk), .rst(rst), .x(x), .detect(detect));
  
  initial begin
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor ("At time = %t, Out= %d",$time,detect);
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
    
    #20 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
