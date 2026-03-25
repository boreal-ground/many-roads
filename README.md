# many-roads
A simple script switcher / menu system for monome grid iii.

## How to install

Designed to run on a monome grid with [iii firmware](https://monome.org/docs/iii/) installed.

Connect your monome grid using the [diii](https://monome.org/diii/) browser utility, and upload many-roads.lua. In the left-hand menu locate many-roads.lua, and select **'first'** from the **'...'** menu. See [dii documentation](https://monome.org/docs/iii/diii/) for more guidance on uploading and managing ii scripts.

## In use

On launch many-roads iterates over the lua scripts currently installed on the monome grid, and illuminates an led per script (filtering out init.lua, lib.lua, pset files etc.).  Pressing the corresponding button launches that script.  A listing of script -> button assignments is output to the dii terminal on script launch.

There's currently a hard limit of 16 scripts (i.e. one full grid row).  I'll experiment with extending that capability for a future version.

Many-roads was built and tested using a monome 128 grid (late 2022 edition). It should also run on a 256 grid, but is currently untested.

I may add further features in the future.

## Acknowledgements

Credit to [monome](https://monome.org/) for creating the monome grid, and all their work on implementing the iii lua scripting environment.
Particular thanks to tehn for explaining how to retrieve the file listing.

I learned a huge amount about writing lua through reading monome iii and norns scripts generously shared on [lines](https://llllllll.co/).
