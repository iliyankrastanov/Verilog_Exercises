module counter (dataout, vout, clk, res, stop, vin);
input clk;
input res;
input stop;
input vin;
output reg [7:0] dataout;
output reg vout;
			
	always @(posedge clk)
		begin
          if(res)
				dataout <= 8'b0;
			else  
				dataout <= dataout + 8'b1;
		end
  always @ (posedge vin)
		begin
          if (~stop)
				vout = 1'b1;
			else
				vout = 1'b0;
		end
  
	
endmodule
