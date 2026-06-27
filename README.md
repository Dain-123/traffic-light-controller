# traffic-light-controller
Verilog-based Traffic Light Controller with FSM, emergency, pedestrian, and sensor logic
# Traffic Light Controller (Verilog)

## Description
This project implements a finite state machine (FSM) based traffic light controller using Verilog HDL.

## Features
- FSM-based design
- Emergency override
- Pedestrian crossing support
- Sensor-based timing extension
- Night mode support

## States
S0 - NS Green  
S1 - NS Yellow  
S2 - All Red  
S3 - EW Green  
S4 - EW Yellow  
S5 - Pedestrian  
S6 - Emergency  

## Tools Used
- Verilog HDL
- EDA Playground
- EPWave Simulator

## How to Run
1. Open EDA Playground
2. Paste RTL and testbench
3. Run simulation
4. View waveform in EPWave

## Output
Shows correct traffic sequencing with priority-based control logic.
