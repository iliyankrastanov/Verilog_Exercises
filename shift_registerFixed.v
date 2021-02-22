
module shift_register(shift_count, shift_reg,data_out,valid_fifo, data_in, valid_in, clk, rst);

  input clk;
  input rst;
  input 	[7:0] 	data_in;
  input		[7:0] 	valid_in;
  output 	[31:0] 	data_out;
  output 			valid_fifo;
  output reg[31:0] 	shift_reg;
  output reg[31:0] 	shift_count;

  initial shift_reg = 32'b0;
  
  always @(posedge clk)
begin
  if (rst)
    shift_reg <= 32'b0;
  else 
    
  shift_reg <= {shift_reg, data_in};

end

assign data_out = shift_reg;

  always @(posedge clk) //valid_in
    begin
	    if (!valid_in)
		    shift_count <= 32'b0;
		else
		     shift_count <= shift_reg + 1;
        end
  
	
	assign valid_fifo = {4{shift_count}};
  
endmodule
