Day 1
Design and verify a 2:1 mux

Interface Definition
The module should have the following interface:

input   wire [7:0]    a_i   - First leg of the mux
input   wire [7:0]    b_i   - Second leg of the mux
input   wire          sel_i - Mux select
output  wire [7:0]    y_o   - Mux output




Solution : 

To design a multiplexer (mux), you need to consider the number of inputs, select lines, and the output width. Here's a general procedure to design a mux:

Determine the number of inputs (N): Decide how many inputs your mux will have. For example, a 2-to-1 mux has two inputs, while a 4-to-1 mux has four inputs.

Determine the number of select lines (S): The number of select lines is determined by the formula S = log2(N). For example, a 2-to-1 mux requires 1 select line (2 = 2^1), while a 4-to-1 mux requires 2 select lines (4 = 2^2).

Determine the output width (W): Decide the width of the output based on the width of the inputs. The output width should be the same as the width of the inputs.

Declare the module: Declare the module with the appropriate input and output ports. The input ports will include the data inputs and select lines, while the output port will be the mux output.

Implement the mux logic: Use conditional statements or logical operations to implement the mux logic. The output should be selected based on the select lines.

Assign the output: Assign the selected input to the output port.

End the module: End the module declaration.

Testbench notes:

In Verilog, reg is commonly used to model input and output signals in a testbench. While wire or logic can also be used, reg is often preferred for testbench inputs due to the following reasons:

Procedural Assignments: Testbenches typically involve procedural assignments to change the values of inputs over time. reg is well-suited for procedural assignments, as it allows for easy assignment and change of values using blocking (=) or non-blocking (<=) assignments.

Initial Values: reg allows for easy initialization of input values using blocking assignments in the initial block. This allows you to set the initial values of the inputs before the simulation starts.

Sensitivity to Changes: reg signals are sensitive to changes in the simulation, meaning that any changes to the value of a reg signal will trigger the procedural blocks that depend on it. This behavior is desirable in a testbench, as it allows for the simulation to respond to changes in inputs and drive the design accordingly.

While wire or logic can also be used for testbench inputs, they are more commonly used for interconnecting modules in the design itself. Using reg for testbench inputs helps maintain consistency and clarity in the code, making it easier to understand and modify the testbench as needed.