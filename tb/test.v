module test;

  /* Make a reset that pulses once. */
  reg reset = 0;
  initial begin
     $dumpfile("test.vcd");
     $dumpvars(0,test);

     # 1 reset = 0;
     # 10 reset = 1;
     # 600 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [7:0] value;
  adc_spi_clocks c1 (reset, clk, sck, cnv);

  initial
     $monitor("At time %t, value = %h (%0d)",
              $time, value, value);
endmodule // test
