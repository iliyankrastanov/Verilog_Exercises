interface valid_in1 (input clk);
logic din;
logic res;
logic out;

modport dut (input clk, din, res, output out);
modport tb (input out, output clk, din, res, import monitor);

task monitor ();
while (1) begin
@(posedge clk);

if (din==1'b1) begin
$display ("@%0dns res %b out %b din %b clk %b",
$time, res, out, din, clk);
end
end
endtask
endinterface: valid_in1

            module valid (valid_in1.dut din1);

valid_in dut1 (.clk(din1.clk),
               .din(din1.din),
			   .res(din1.res),
			   .out(din1.out));	  
endmodule

program validp (valid_in1 tin);

default clocking cb @(posedge tin.tb.clk);
endclocking

initial 
begin
fork
tin.monitor();
join_none
tin.tb.res <= 0;
tin.tb.din <= 1;
##10 tin.tb.res <= 1;
##1 tin.tb.din <= 0;
##10 tin.tb.din <= 1;
##5 $finish;
end
endprogram

module Test1 ();
logic clk= 0;
always #1 clk = ~clk;

valid_in1 cin (clk);
valid dut (cin);
validp tb (cin);
  
initial 
  begin
   
    	$dumpfile("dump.vcd");
    	$dumpvars(1);
    end
endmodule
