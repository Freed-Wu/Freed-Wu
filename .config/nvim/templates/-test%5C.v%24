`include "{{ substitute(expand('%:t:r'), '-test\.v$', '', '') }}.v"

module test #(
   parameter CLK = 1e9,
   parameter RST = 2e10
);


reg clk = 0;
reg rstn = 1;

initial begin
   $dumpfile("test.vcd");
   $dumpvars;
   #RST $finish;
end

always #(CLK / 2) clk <= ~clk;

endmodule
