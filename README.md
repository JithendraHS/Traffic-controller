# ModelSim Traffic Controller

## Overview
This repository contains Verilog code for a simple traffic controller module implemented and simulated using ModelSim. The traffic controller module controls the traffic lights at an intersection.

## Contents
- `traffic_controller.v`: Verilog module for the traffic controller.
- `testbench.v`: Verilog testbench to simulate the traffic controller module.
- `README.md`: This README file.

## Finite state machine

## Simulated output
![image](https://github.com/JithendraHS/Traffic-controller/assets/37045723/50d1e2ee-9b3d-420d-8aca-1ef314805b61)

## Running the Simulation
1. **Requirements**: Ensure you have ModelSim installed on your system.
2. **Clone the Repository**: Clone this repository to your local machine.
    ```bash
    git clone https://github.com/your-username/modelsim-traffic-controller.git
    ```
3. **Navigate to the Directory**: Go to the directory where you cloned the repository.
    ```bash
    cd modelsim-traffic-controller
    ```
4. **Open ModelSim**: Open ModelSim from your system.
5. **Compile**: Compile the Verilog files in ModelSim.
   - You can compile the files manually using the ModelSim GUI.
   - Alternatively, you can use the command line within ModelSim:
     ```tcl
     vlog traffic_controller.v testbench.v
     ```
6. **Simulate**: Run the simulation in ModelSim.
   - Load the testbench and traffic controller module into the simulation workspace.
   - Start the simulation.
7. **View Results**: Once the simulation completes, you can view waveforms to analyze the behavior of the traffic controller.


