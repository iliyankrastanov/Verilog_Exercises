
module shift_register(data_out, data_in, clk);

input data_in;
input clk;
output data_out;

reg[31:0] shift_reg;

initial shift_reg = 32'b0;
always@(posedge clk)
begin

shift_reg <= {shift_reg[31:0], data_in};

end
wire data_out;
assign data_out = shift_reg[31];


endmodule
