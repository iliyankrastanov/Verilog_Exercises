
module shift_register(data_out,valid_fifo data_in, valid_in, clk);

  input clk;
  input [7:0] data_in;
  input [7:0] valid_in;
  output [31:0]data_out;
  output valid_fifo;

  reg[31:0] shift_reg;

initial shift_reg = 32'b0;
  always@(valid_in)
begin

  shift_reg <= {shift_reg, data_in};

end
wire data_out;
assign data_out = shift_reg;

  always @(posedge clk or valid_in)
    begin
				shift_reg <= shift_reg + 1;
        end
  assign valid_fifo = {4{shift_reg}};
endmodule
