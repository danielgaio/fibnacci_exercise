module fibonacci(input clk, clr, output [13:0]f);
	
  	reg [13:0] fn1, fn;
	
	parameter fib_max = 21;
		
	// com reset assincrono
	always @(posedge clk) begin
		if (clr == 1) begin
			fn <= 0;
			fn1 <= 1;
		end else begin
			if (fn1 <= fib_max) begin
				fn1 <= fn1 + fn;
				fn <= fn1;
			end else begin
				fn <= 0;
				fn1 <= 1;
			end
		end
	end
	assign f = fn;
	
endmodule