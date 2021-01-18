  
module memory_dr(memory_out, data, write, address, clk);
input clk;
input reg [31:0]data;
input write;
input address;
output reg [31:0] memory_out;

						
	reg [31:0] memory [63:0];
	
	always @(posedge clk) 
	begin
		if(write) begin
			memory[address] <= data;
		end
			memory_out <=memory[address];
	end
	
endmodule