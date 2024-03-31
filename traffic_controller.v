// Module declaration for the traffic controller
module traffic_controller(
  input wire clk,          // Clock input
  output reg [2:0] A,      // Output port A for traffic light
  output reg [2:0] B,      // Output port B for traffic light
  output reg [2:0] C,      // Output port C for traffic light
  output reg [2:0] D       // Output port D for traffic light
);

// Declaration of internal variables
integer clk_count;         // Counter for clock cycles
reg [2:0] state;           // State variable for controlling the traffic lights

// Initial block to initialize variables
initial begin
   A = 3'b001;             // Initial state for traffic light A
   B = 3'b001;             // Initial state for traffic light B
   C = 3'b001;             // Initial state for traffic light C
   D = 3'b001;             // Initial state for traffic light D
   clk_count = 0;          // Initialize clock counter
   state = 0;              // Initialize state variable
end

// Always block triggered on positive edge of the clock
always @(posedge clk) begin
   clk_count = clk_count + 1;  // Increment clock counter
   // Condition to change state after 30 clock cycles if the least significant bit of state is 0
   if (clk_count == 30 && ((state & 3'b001) == 0)) begin
       state = state + 1;        // Increment state
       clk_count = 0;            // Reset clock counter
   end
   // Condition to change state after 10 clock cycles if the least significant bit of state is 1
   else if (clk_count == 10 && ((state & 3'b001) == 1)) begin
       state = state + 1;        // Increment state
       clk_count = 0;            // Reset clock counter
   end
end

// Another always block triggered on positive edge of the clock
always @(posedge clk) begin
   // Case statement based on the current state
   case(state)
       3'b000: begin   // State 000: A is green, others are red
           A = 3'b100;
           B = 3'b001;
           C = 3'b001;
           D = 3'b001;
       end
       3'b001: begin   // State 001: B is green, others are red
           A = 3'b010;
           B = 3'b001;
           C = 3'b001;
           D = 3'b001;
       end
       3'b010: begin   // State 010: C is green, others are red
           A = 3'b001;
           B = 3'b100;
           C = 3'b001;
           D = 3'b001;
       end
       3'b011: begin   // State 011: B and C are green, others are red
           A = 3'b001;
           B = 3'b010;
           C = 3'b001;
           D = 3'b001;
       end
       3'b100: begin   // State 100: D is green, others are red
           A = 3'b001;
           B = 3'b001;
           C = 3'b100;
           D = 3'b001;
       end
       3'b101: begin   // State 101: C and D are green, others are red
           A = 3'b001;
           B = 3'b001;
           C = 3'b010;
           D = 3'b001;
       end
       3'b110: begin   // State 110: B, C, and D are green, A is red
           A = 3'b001;
           B = 3'b001;
           C = 3'b001;
           D = 3'b100;
       end
       3'b111: begin   // State 111: A, B, and C are green, D is red
           A = 3'b001;
           B = 3'b001;
           C = 3'b001;
           D = 3'b010;
       end
       default: begin  // Default case: Reset state to 000
           state = 3'b000;
       end
   endcase
end

endmodule

