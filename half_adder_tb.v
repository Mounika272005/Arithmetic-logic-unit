`timescale 1ns/1ps

module adders_example_tb;
  reg A, B;
  wire S, C;

  half_adder_dataflow uut(S, C, A, B);

  initial begin
    $display("time\tA B | S C");
    $monitor("%g\t%b %b | %b %b", $time, A, B, S, C);

    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    #10; // Allow GTKWave to record last change
    $finish;
  end

  initial begin
    $dumpfile("adders_example.vcd");
    $dumpvars; // <- Capture all signals
  end
endmodule
