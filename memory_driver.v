module memory_driver( input clk, rst, input[31:0] data_in, output reg write, addr, output stop, output reg memory_full);

parameter state_1 = 2'b00;
parameter state_2 = 2'b01; 
parameter state_3 = 2'b10;
 	
reg [1:0] current_state, next_state;

`define memory_dr 32'h7FFFFFFF
	reg [31:0] memory [63:0];

always @(posedge clk)
		begin
			if(rst)
				current_state <= #1 state_1;
			else
				current_state <= #1 next_state;

	always @(current_state or data_in or write or addr)
			begin
			next_state = current_state;
				case (current_state)
					state_1:
						if (data_in == 1)
							next_state <= state_2;
						else
							next_state <= state_1;
					
					state_2:
						if (data_in == 1 && data_in > `memory_dr)
							begin
								write = write +1;
								memory[addr] = data_in; 
								addr = addr + 1;
								next_state <= state_3;
							end
						else if (data_in == 1 && data_in < `memory_dr) 
							begin
								write = write - 1;
								memory_full = memory[addr];
								next_state <= state_1;
							end
							
					state_3:
						if (data_in == 0) 
							begin
								write = 0;
								addr = 0;
								next_state <= state_1;
							end
						else next_state <= state_3;
						
						default : next_state <= state_1;
					endcase
				end
				
	assign stop = memory_full;
	endmodule