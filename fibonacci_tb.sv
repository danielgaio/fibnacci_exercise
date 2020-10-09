// Code your testbench here
// or browse Examples

module fibonacci_tb;

  // inputs of dut as reg
  reg clk_tb, clr_tb;

  // outputs of dut as wire
  wire [13:0]f_tb;

  fibonacci my_fib_dut (
    .clk(clk_tb),
    .clr(clr_tb),
	 .f(f_tb)
  );

  initial begin
    clk_tb = 0;
    clr_tb = 0;
    clk_tb = 0;
  end

  always
    #5 clk_tb = ~clk_tb;

  initial begin
    $dumpfile("fibonacci.vcd");
    $dumpvars;
  end

  initial begin
    //$display("\t clk_tb, \t clr_tb, \t f_tb");
    $monitor("\t %b, \t %b, \t %d", clk_tb, clr_tb, f_tb);
  end

  initial begin
    #100 $finish;
  end
  
  
endmodule