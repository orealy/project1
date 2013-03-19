README
============

Files
------------
1. mosQD4.7.par - parameter file (supplied) for all relevant materials.
2. structure.scm - structrue/doping/refinement(grid size)/contacts are defined.
3. settings.cmd - gate voltages/temperature/equations to be solved/structure
   files.. are specified here for DESSIS(?)

Notes on File Types
-------------------

See 2.4.3 of the DEVISE manual for more information.

DESSIS:
* `scm` - Scheme script file. Used by Devise.
* `cmd` - MESH command file. Doping and refinement file.
* `bnd` - DF-ISE boundary representation.
* `sat` - ASCII version of complete model.
* `lyt` - DF-ISE layout file representation.
* `lay` - PROSIT mask layout representation.
* `grd` - DF-ISE mesh representation.

To load a DF-ISE model, run `devise` on a MESH file and the boundary file. Note
that DEVISE assumes they have the same basename, and will look for the other if
only one is given.

MESH:
In general mesh files should have 'msh' somewhere in their name.
* `grd`: output device geometry file
* `dat`: output impurity concentration file

DESSIS:
In general mesh files should have 'des' somewhere in their name.
* `grd`: input file from MESH
* `dat`: input file from MESH
* `_des.dat`: output data for TECPLOT
* `_des.plt`: output for current, voltages, charges, and temperature
* `_ac_des.plt`: output for small signal AC analysis
* `_des.log`: general output. plain text compilation of all output.

TECPLOT:
* `grd` - input mixed-element grid from MESH
* `dat` - input mixed-element data from DESSIS
* `plt` - XY plots from desis from DESSIS

TCAD Flow
--------------
Henry's thesis also describes the flow of TCAD. Fahd is the resisdent expert.

1. Create structure:
    * Input:
    * Output: grid file (.grd), doping file (.dat)
2. View in Devise:
    Fill in.
3. Create mesh file
    Fill in.
4. Solve equations:
    * DESSIS
    * Main input: command file (settings_des.cmd)
    * Other inputs: grid (.grd), doping (.dat), parameter file (.par)
    * Output: plot (.plt), data (.dat)

5. View results

Fahd's Description
-------------------
Step 1 - define the model file(e.g. SD201_mod.cmd). Run the command "devise -l
SD201_mod.cmd". This will create a structure which can be seen on the GUI and
also generate output files (eg. SD.bnd, SD.cmd...), the prefix which you specify
in the model file.

Step 2 - Run the command "mesh -P SD". that will create a file SD_msh.grd and
SD_msh.dat

Step 3 - Once this is done run "dessis SD201_pot.cmd". Note that the
"SD_msh.grd", "SD_msh.dat" and mosQD4.7.par are also specified in the potential
file(SD201_pot.cmd). All the required equations will be solved.

Once, you reach this step, I will give you a .cpp file for extracting the TCAD
data and using them in a program like MATLAB for further processing.

Note from Fahd
----------------------
Right now the work function of aluminium is set at 4.7 in
the parameter file, to take into account charges indirectly at the Si/SiO2
interface of our devices. But ideally, it is ~4.28. If you change the work
function in the parameter file, you also have to add interface charges manually
in the potential file (SD201_pot.cmd). I can help you with that later on.

Also note that the line commenting character in "SD201_mod.cmd" is ";" and
"SD201_pot.cmd" is "#".
