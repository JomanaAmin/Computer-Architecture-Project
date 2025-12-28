Single-Cycle / Pipelined RISC-V Processor

Overview

This repository contains the Verilog implementation of a RISC-V processor designed for the CSC311 – Introduction to Computer Architecture course at Nile University. The processor supports arithmetic, logical, memory, and branch instructions. It has been implemented as a single-cycle design and later adapted to a pipelined version to improve instruction throughput.

Features

Supports R-Type, I-Type, Load/Store, and Branch instructions.

Modular design including:

ALU & ALU Control

Control Unit

Register File & Immediate Generator

Program Counter & Branch Logic

Instruction and Data Memory

Testbenches for individual modules and full CPU simulation.

Designed in Verilog HDL and simulated using Vivado.
