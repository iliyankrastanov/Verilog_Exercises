
module shift_register(data_out, data_in, valid_in, clk);

  input clk;
  input [7:0] data_in;
  input [7:0] valid_in;
  output [31:0]data_out;

  reg[7:1] shift_reg;

initial shift_reg = 8'b0;
  always@(valid_in)
begin

  shift_reg <= {shift_reg, data_in};

end
wire data_out;
  assign data_out = shift_reg;


endmodule
