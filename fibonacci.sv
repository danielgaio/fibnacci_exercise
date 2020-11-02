
// O módulo possui dois sinais de entrada (1 bit cada) e um de saida (14 bits)
module fibonacci(input clk, reset, output [13:0]f);
	
	// registradores para armazenar os valores da soma atual e da anterior
  	reg [13:0] fn1, fn;
	
	// valor até o qual a sequencia será calculada (corresponde a sétima saida)
	parameter fib_max = 21;
		
	// with assincronous reset
	always @(posedge clk) begin

		if (reset == 1) begin

			// no reset são carregados os primeiros valores a serem somados
			fn <= 0;
			fn1 <= 1;

		end else begin

			// vendo se o ultimo valor somado não ultrapassa o limite estipulado
			if (fn1 <= fib_max) begin
				fn1 <= fn1 + fn;
				fn <= fn1;

			// se o limite for alcançado os registradores são reinicializados
			end else begin
				fn <= 0;
				fn1 <= 1;
			end

		end
	end

	// direcionando resultado da soma para o pino de saida
	assign f = fn;
	
endmodule