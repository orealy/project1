README
============

Files
------------
1. mosQD4.7.par - Parameter file (supplied) for all relevant materials.
2. structure.scm - This is the model file where the
   structrue/doping/refinement(grid size)/contacts are defined.
3. settings.scm - This is the file where the gate voltages/temperature/equations
   to be solved/structure files.. are specified.

Notes on File Types
-------------------

* `scm`: Scheme script file. Used by Devise.
* `cmd`: MESH command file.
* `bnd`: DF-ISE boundary file.

To load a DF-ISE model, run `devise` on a MESH file and the boundary file. Note
that DEVISE assumes they have the same basename.

TCAD Flow
--------------
Henry's thesis also describes the flow of TCAD. Fahd is the resisdent expert.

1. View in Devise
    Fill in.
2. Create mesh file
    Fill in.
3. Solve equations
    Fill in.
4. View results

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

Step 4 - To view the results, run "tecplot_ise SD_des.dat SD_msh.grd". All the
necessary plots such as electron density, conduction band, etc... will be seen
in a GUI.

For the time being, make sure that you are comfortable with the flow, and then
try to understand the commands specified in the model and potential files. The
way to go about with the commands is : look up each command in the TCAD manuals
I had given you. Reading the complete manual from scratch is quite impractical.

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
