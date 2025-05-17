# VLSI Standard Cell Library and ALU Design

## Overview

This repository documents the design and characterization of a custom standard cell library and its integration into a 32-bit Arithmetic Logic Unit (ALU). The project was implemented using Cadence Virtuoso, Synopsys Design Vision, PrimeTime, and HSPICE across GF 65nm process technology.

## Project Breakdown

### Project 1: 16-bit ALU (Behavioral)
- Developed behavioral Verilog code and testbench.
- Implemented and simulated using Xilinx Vivado.

### Project 2: 32-bit ALU (Synthesizable)
- Scaled the design from 16-bit to 32-bit to improve performance and reduce latency.
- Generated a gate-level netlist using Synopsys Design Vision.
- **Result:** 4164 cells used in synthesis.

### Project 3: Inverter Cell (Layout & Characterization)
- Designed and characterized a CMOS inverter using GF65nm process.
- Layout included defined pins (IN, OUT, VDD!, GND!) with Wp = 1.9 µm, Wn = 1.5 µm, L = 65 nm.
- Verified using DRC, LVS, and PEX, with HSPICE simulations for waveform validation.

### Project 4: Custom Standard Cell Library
- Developed 8+ standard cells: INV, NAND2, NOR2, NAND3, NOR3, AOI332, OAI4331, and a custom 11-input logic gate.
- Designed with consistent height (3.312 µm) and optimized pin-pitch (0.368 µm).
- Ensured slew rate of 30 ps and load capacitance of 55 fF.
- Verified using DRC, LVS, and PEX.
- Liberty files generated using Synopsys PrimeLib.

### Project 5: D Flip-Flop Design
- Designed a falling-edge triggered DFF with height 4.048 µm.
- Optimized to minimize usage of the M2 layer for improved routability and reduced parasitic effects.
- Characterized timing parameters: setup time, hold time, clock-to-Q delay.

### Project 6: ALU32 Physical Design
- Integrated all custom cells into a full 32-bit ALU layout.
- Characterization completed using PrimeLib and Library Compiler.
- Synthesized using Design Vision; netlist shows **7402 cells used**.
- Placement and routing performed using Innovus; final checks using Virtuoso.
- Performed STA using PrimeTime to evaluate performance and power metrics.

## Design Considerations
- **Euler Path Optimization:** Minimized diffusion breaks for efficient layout.
- **Filler Cells:** Customized to reduce empty spaces; final width = 0.26 µm.
- **M2 Layer Constraints:** Height adjusted to resolve ~2000 initial DRC violations, reduced to 572.
- **Clocking Strategy:** Cascaded inverters implemented for global clock synchronization and glitch prevention.

## Tools Used
- **Cadence Virtuoso** – Layout and schematic design
- **HSPICE** – Waveform simulation and timing analysis
- **Synopsys Design Vision** – RTL-to-gate-level synthesis
- **PrimeTime** – Static timing analysis
- **PrimeLib** – .lib and .db generation
- **Innovus** – Place and route

## File Structure
