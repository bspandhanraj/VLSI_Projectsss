# Master-Slave JK Flip-Flop

## Overview
This project implements a Master-Slave JK Flip-Flop using **Behavioral Modeling** in Verilog. The master-slave configuration was historically designed to eliminate the "race-around condition" inherent in level-triggered flip-flops. It achieves this by cascading two latches: a "Master" latch that processes the input, and a "Slave" latch that controls the output. 

## Architecture & States
The circuit operates on a full clock cycle process, effectively making the entire flip-flop **negative-edge triggered** from the perspective of the outside world:
1. **Master Stage:** On the rising edge (↑) of the clock, the Master latch evaluates the `J` and `K` inputs and updates its internal state. The final output `Q` remains unchanged.
2. **Slave Stage:** On the falling edge (↓) of the clock, the Slave latch isolates itself from the inputs and transfers the Master's state to the final output `Q`.

### State Table
| `clk` | `j` | `k` | `rst` | `q (Next State)` | `q_bar` | Description |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| X | X | X | `1` | `0` | `1` | Asynchronous Reset |
| ↓ | `0` | `0` | `0` | `q` | `~q` | Hold (No change) |
| ↓ | `0` | `1` | `0` | `0` | `1` | Reset State |
| ↓ | `1` | `0` | `0` | `1` | `0` | Set State |
| ↓ | `1` | `1` | `0` | `~q` | `q` | Toggle (Invert current state) |

### Logic Diagram




## Simulation & Verification
The testbench validates the two-stage delay. If you look closely at the simulation waveform, you will observe the following behavior:
1.  **Input Application:** Inputs `J` and `K` are changed.
2.  **Master Evaluation:** On the rising edge of `clk`, the internal `master_q` variable updates.
3.  **Slave Output:** The external output `Q` does not update until the *falling* edge of `clk` occurs half a cycle later.
4.  **Toggle Mode:** Holding `J=1` and `K=1` results in a clean, predictable toggle exactly once per clock cycle, proving the race-around condition is defeated.

### Waveform Output




## Tools Used
* **Language:** Verilog (SystemVerilog)
* **Modeling Style:** Behavioral (Two-stage Edge-Triggered)
* **Simulation:** EDA Playground / Icarus Verilog + EPWave
