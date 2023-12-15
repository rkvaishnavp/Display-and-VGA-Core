# Display and VGA Core

This repository hosts a Display Core implemented in Verilog, capable of generating VGA signals conforming to VGA Standards (red, green, blue, hsync, vsync) in a 4-bit format RGB444. The core is designed to take a mem file as an image source in binary uncompressed format, where the mem file is generated using the Image Module Python package. The package accepts a cropped image (640x480) as input.

## Features

- **VGA Signal Generation:** Generates VGA signals with standards-compliant parameters for red, green, blue, hsync, and vsync in a 4-bit RGB444 format.

- **Image Source:** Utilizes a mem file in binary uncompressed format as an image source. This file is generated using the Image Module Python package.

- **Decode Unit Testing:** A decode unit is implemented in Verilog HDL to verify the proper functioning of the core. It logs data, and Python scripts are used to compare the input image and output data to confirm the core's accuracy.

## Tools and Technologies

- Verilog
- Python
- Digital Design
- Xilinx Vivado
- Artix A7
