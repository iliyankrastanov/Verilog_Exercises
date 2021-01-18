module counter (valid_in1, count, clk, rst, click, load);
input clk;
input rst;
input click;
input load;
output reg [7:0] valid_in1;
output reg count;

valid_in(.clk(clk), .rst(rst),.button(click));
			
	always @(posedge clk)
		begin
		if(rst)
				valid_in1 <= 8'b0;
			else if (load)
					valid_in1 <= load;
			else  
				valid_in1 <= valid_in1 + 8'b1;
		end
	always @ valid_in1
		begin
			if (valid_in1 == load)
				count = 1'b1;
			else
				count = 1'b0;
		end
	
endmodule
