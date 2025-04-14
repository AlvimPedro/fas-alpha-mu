# Simulations for the IEEE paper "On the Performance of Fluid Antenna Systems Under α-μ Fading Channels"

This repository contains the simulation codes used in the article *On the Performance of Fluid Antenna Systems Under α-μ Fading Channels*. The codes were implemented in **MATLAB** and reproduce the results presented in the article. https://ieeexplore.ieee.org/document/10272689

## Repository Structure
-  **CAP/:** Folder containing the Ergodic Capacity codes.
-  **LCR/:** Folder containing the Level Crossing Rate codes.
-  **OP/:** Folder containing the Outage Probability codes.
-  **figs/:** Folder containing the Figures visual codes.
-  **final_figs/:** Folder containing the Figures visual codes.
-  **README.md:** This project description file.

## Requirements

To run the codes, you must have:
- **MATLAB** installed (recommended version: R2017 or higher);

## How to Run

1. Clone this repository:
      ```sh
   git clone https://github.com/AlvimPedro/fas-alpha-mu.git
   ```
2. Run the code corresponding to the desired figure in MATLAB:
   ```matlab
   run('OP/PoutMRCFig1a.m')
   ```


## References

If this code is useful for your research, please cite the article:

> Pedro D. Alvim; Hugerles S. Silva; Fabrício O. Barcelos; Paulo R. de Moura; Ugo S. Dias; Osamah S. Badarneh *On the Performance of Fluid Antenna Systems Under α-μ Fading Channels*, 2024.

## Contact

For questions or suggestions, contact one of the authors (pedro.alvim@redes.unb.br, hugerles.silva@unb.br, udias@unb.br, osamah.badarneh@gju.edu.jor, rausley@inatel.br) or open an *issue* in this repository.
