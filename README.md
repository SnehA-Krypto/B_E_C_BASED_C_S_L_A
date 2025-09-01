# B_E_C_BASED_C_S_L_A

Carry Select Adder (CSLA) in Verilog
## Project Overview

This project implements a 32-bit Carry Select Adder (CSLA) in Verilog HDL without using parameterized modules. Instead, the design uses explicit repeated instantiations of smaller ripple carry adders (RCA) and multiplexers to realize the CSLA architecture.

The design is written for simulation and verification on Icarus Verilog (iverilog), and waveforms can be analyzed using GTKWave or directly on EDAPlayground.

## Technical Details
🔹 CSLA Architecture

The Carry Select Adder is an efficient adder structure that reduces propagation delay compared to a Ripple Carry Adder (RCA).

The idea is to pre-compute sum and carry for both possible values of the incoming carry (0 and 1) in parallel.

A multiplexer then selects the correct result once the actual carry-in is known.

This approach reduces the dependency chain length compared to RCA, improving speed.

🔹 Design Approach

Basic Building Blocks:

Full Adder (FA): Computes single-bit sum and carry.

Ripple Carry Adder (RCA): Built from cascaded full adders.

2:1 Multiplexer: Selects between carry and sum outputs from two RCAs.

CSLA Construction:

The 32-bit CSLA is divided into smaller blocks (e.g., 4-bit or 8-bit RCAs).

For each block, two RCAs are instantiated:

One assuming carry-in = 0.

One assuming carry-in = 1.

A multiplexer selects the correct sum and carry outputs based on the propagated carry.

Non-Parameterized Implementation:

Instead of generic modules with parameters, the design explicitly writes out all 32 bits.

This ensures better transparency of the structure and avoids issues with include files in Icarus/EDAPlayground.

## Testbench

The testbench (csla_tb.v) verifies correctness of the design using hexadecimal input vectors.

$monitor is used to continuously display inputs and outputs during simulation.

$dumpfile and $dumpvars are used to generate waveform files (.vcd) for debugging in GTKWave.



##  Features
- Modular design with reusable components (RCA, MUX, BEC).  
- Efficient CSLA implementation using BEC to reduce delay/area.  
- Simple testbench for quick verification.  
- Easily scalable to larger bit-widths.  



## Future Improvements
- Add **timing and power analysis** using industry-standard tools (Synopsys Design Compiler, Cadence Genus).  
- Implement a **parameterized CSLA** (supporting any N-bit size automatically).  
- Compare delay and area with traditional CSLA and RCA.  

---

##  Author
Sneha Majumdar – B.Tech ECE  
Project done for learning and practice in **VLSI Digital Design**.  
