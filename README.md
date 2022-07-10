# Display and VGA Core in Verilog
In this Project I have written Verilog code for Display Core (display_core.v)\
which generates VGA Signals (red, green, blue, hsync, vsync)\
and these signals are taken into VGA Core(vga.v) for display

## Cropping an image into size 640 x 480
This is done using crop.py\
cropped.jpeg is produced

## Binary File Generation
This is done using bin.py\
image.bin is produced

## Generation of VGA signals
Done using display_core.v\
Display Core takes pixeldata from image.bin(generated using bin.py)\
and converts it and outputs vga signal

## Displaying VGA singals inputs in terminal
Done using vga.v\
VGA Core processes signals sent from display_core.v and displays the pixeldata in the terminal
