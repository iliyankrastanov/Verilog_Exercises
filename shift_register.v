
module shift_register(data_out, data_in, valid_in, clk);

  input clk;
  input [7:0] data_in;
  input [7:0] valid_in;
  output [31:0]data_out;

  reg[31:0] shift_reg;

initial shift_reg = 32'b0;
  always@(valid_in)
begin

  shift_reg <= {shift_reg, data_in};

end
wire data_out;
  assign data_out = shift_reg;


endmodule
