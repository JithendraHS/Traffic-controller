`timescale 1ns / 1ps

module testbench();

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in nanoseconds

  // Signals
  reg clk;
  wire [2:0] A_tb, B_tb, C_tb, D_tb;

  // Instantiate the traffic controller module
  traffic_controller traffic_controller_inst (
    .clk(clk),
    .A(A_tb),
    .B(B_tb),
    .C(C_tb),
    .D(D_tb)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Initial begin block
  initial begin
    // Initialize clock
    clk = 0;

    // Wait for a few clock cycles for initialization
    #100;

    // Print header
    $display("Time\tA\tB\tC\tD");

    // Simulate for 500 ns
    repeat (50) begin
      // Display time and output values
      $display("%0t\t%b\t%b\t%b\t%b", $time, A_tb, B_tb, C_tb, D_tb);
      
      // Wait for one clock cycle
      #CLK_PERIOD;
    end

    // End simulation
    $finish;
  end

endmodule
