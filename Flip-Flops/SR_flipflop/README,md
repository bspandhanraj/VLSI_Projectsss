# Synchronous SR Flip-Flop

## Overview
This project implements a synchronous, edge-triggered Set-Reset (SR) Flip-Flop. The design utilizes **Behavioral Modeling** in Verilog, employing an `always` block that is sensitive to the rising edge of a clock signal (`clk`) and an asynchronous active-high reset (`rst`). This model defines the functional logic rather than mapping out individual gates.

## Architecture & States
The SR flip-flop is a fundamental 1-bit memory element. It accepts two inputs, Set ($S$) and Reset ($R$), which determine its next state only upon a specific clock event. It also includes an asynchronous active-high Reset for initial state control.

### State Table
| `clk` | `s` | `r` | `rst` | `q(next_state)` | `q_bar(next_state)` | Description |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| X | X | X | `1` | `0` | `1` | Asynchronous Reset |
| ↑ | `0` | `0` | `0` | `q` | `~q` | Hold State (No change) |
| ↑ | `0` | `1` | `0` | `0` | `1` | Reset State |
| ↑ | `1` | `0` | `0` | `1` | `0` | Set State |
| ↑ | `1` | `1` | `0` | `x` | `x` | Restricted/Invalid Condition |
| ↓ | X | X | `0` | `q` | `~q` | No state change on falling edge |

### Logic Diagram
![Synchronous SR Flip-Flop Logic Diagram](./SR_FF_diagram.jpeg)

*The diagram shows the cross-coupled gates and the clock-gating logic that makes it synchronous.*

## Simulation & Verification
The provided testbench validates all operational modes of the flip-flop. The simulation sequence is as follows:
1.  **Asynchronous Reset:** A reset pulse initializes the state to $Q=0$.
2.  **Hold Operation:** Inputs $S=0, R=0$ are applied, confirming no state change.
3.  **Reset Operation:** Inputs $S=0, R=1$ are applied, ensuring $Q$ becomes $0$.
4.  **Set Operation:** Inputs $S=1, R=0$ are applied, setting the output $Q$ to $1$.
5.  **Hold Operation:** Inputs $S=0, R=0$ are reapplied, and $Q$ remains $1$.
6.  **Restricted State:** Inputs $S=1, R=1$ are applied on a clock edge, and the simulation results demonstrate an undefined ('x') output.

### Waveform Output
![Synchronous SR Flip-Flop Waveform](./SR_FF_waveform.png)

*Replace this placeholder with a screenshot of your simulated waveform from EDA Playground's EPWave.*

## Tools Used
* **Language:** Verilog (SystemVerilog)
* **Modeling Style:** Behavioral
* **Simulation:** EDA Playground (e.g., Icarus Verilog + GTKWave/EPWave)
