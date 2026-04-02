# LTDESIGN
*Optimize, analyze, and simulate long electrical transmission lines in 3D with this comprehensive MATLAB environment.*

[![MATLAB](https://img.shields.io/badge/MATLAB-App_Designer-blue.svg)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Academic](https://img.shields.io/badge/Status-Academic_Research-success.svg)]()

## Description
**LTDESIGN** is an open-source, MATLAB-based tool for the parametric design, analysis, and simulation of long transmission lines. Developed at the Instituto Tecnológico de Pachuca, this project unifies steady-state electrical analysis, transient dynamics (energization), and 3D spatial-mechanical modeling within an interactive and automated environment.

## Key Features (Analysis Phases)

The script executes a comprehensive workflow divided into 7 phases:

* **Phase I & II: Conductor and Geometry Optimization.** Automated search for the optimal ACSR conductor (maintaining a voltage regulation between 15% and 20%) and iterative analysis of phase spacing.
* **Phase III: Parametric Benchmark.** Performance evaluation (10,000 iterations) comparing matrix solution methods: **Cayley-Hamilton** vs. **Similarity Matrices (SVD)** for exact long-line calculations.
* **Phase IV: Transient Dynamics.** Energization modeling using state-space (`ss` and `lsim`) to observe the instantaneous behavior of voltage, current, and power during the first few cycles.
* **Phase V: Datasheet Generation.** Automatic export of a technical PDF report detailing base parameters, optimal conductors, and transient extremes.
* **Phase VI & VII: 3D Mechanical-Electrical Simulator.** Interactive rendering of catenaries and transmission towers. It includes a smart module that adjusts the tower geometry (60kV to 380kV) by dynamically evaluating the minimum safety clearance based on mechanical tension and span.

## System Requirements
* **MATLAB** (R2020a or higher recommended, due to the native use of `uifigure` and `uigridlayout`).
* **Control System Toolbox** (Required for Phase IV: Transient analysis using `ss` and `lsim`).

## Installation and Quick Start

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/tu-usuario/LTDESIGN.git](https://github.com/tu-usuario/LTDESIGN.git)
    ```
2.  **Set up MATLAB:**
    Open MATLAB, navigate to the downloaded directory, and make sure to add the folder to your *Path*.
3.  **Run the environment:**
    Open the main file in the command window:
    ```matlab
    run ltdesign_main.m
    ```
    *(Note: Replace `ltdesign_main.m` with the exact name of your script if it is different).*
4.  **Workflow:**
    Follow the graphical interface pop-ups. The system will ask for the base parameters (Length, Receiving end voltage, Load demand, Power factor) and will guide you through the parametric analysis and 3D simulation.

## Authors and Citation

Project developed at the **Tecnológico Nacional de México (Instituto Tecnológico de Pachuca)**, Department of Electrical and Electronic Engineering.

**Developers:**
* Zamora Pérez Carlos Daniel
* Pacheco Serrano Julio Noel
* Espejel Rivera María Angélica
* Ordaz Oliver Mario Oscar

If this project is useful for your research or academic work, please consider citing it:

> Zamora-Pérez, C.D., Pacheco-Serrano, J.N., Espejel-Rivera, M.A., & Ordaz-Oliver, M.O. (2026). *LTDESIGN: A MATLAB-based open-source toolbox for parametric design of long transmission lines*. GitHub repository. https://github.com/tu-usuario/LTDESIGN
