
module fibonacci_tb;

  // inputs of dut as reg
  reg clk_tb, reset_tb;

  // outputs of dut as wire
  wire [13:0]f_tb;


  // instanciando o modulo criado
  fibonacci my_fib_dut (
    .clk(clk_tb),
    .reset(reset_tb),
    .f(f_tb)
  );


  // enviando os primeiros sinais para a arquitetura
  initial begin
    clk_tb = 0;
    reset_tb = 1;
  end

  // bloco gerador de clock com periodo de 10 unidades de tempo
  always #5 clk_tb = ~clk_tb;


  initial begin

    #2 reset_tb = 0;

    // exibindo no console textual os valores de todos os sinais, sempre que houver uma mudança em algum deles
    $display("\t clk_tb, \t reset_tb, \t fibonacci value");
    $monitor("\t %b, \t %b, \t %d", clk_tb, reset_tb, f_tb);

  end

  // after 95 time units we have 7 outputs
  initial begin
    #95 $stop;
  end
  
  
endmodule