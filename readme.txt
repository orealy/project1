Chris,

Attached a few example files (from Henry's thesis) you can use to learn TCAD 

1. mosQD4.7.par - This is the parameter file where information about all the materials is given. 
2. SD201_mod.cmd - This is the model file where the structrue/doping/refinement(grid size)/contacts are defined.
3. SD201_pot.cmd - This is the file where the gate voltages/temperature/equations to be solved/structure files.. are specified.

To run the stuff, you need to be on linux or use cygwin in windows. For Cygwin you need the WinX server to see the GUI of TCAD.  You can log into precision with the IP address of PRECISION "129.94.141.206."

The flow of TCAD as stated in Henry's thesis is as follows.

Step 1 - define the model file(e.g. SD201_mod.cmd). Run the command "devise -l SD201_mod.cmd". This will create a structure which can be seen on the GUI and also generate output files (eg. SD.bnd, SD.cmd...), the prefix which you specify in the model file.

Step 2 - Run the command "mesh -P SD". that will create a file SD_msh.grd and SD_msh.dat 

Step 3 - Once this is done run "dessis SD201_pot.cmd". Note that the "SD_msh.grd", "SD_msh.dat" and mosQD4.7.par are also specified in the potential file(SD201_pot.cmd). All the required equations will be solved.

Step 4 - To view the results, run "tecplot_ise SD_des.dat SD_msh.grd". All the necessary plots such as electron density, conduction band, etc... will be seen in a GUI. 

For the time being, make sure that you are comfortable with the flow, and then try to understand the commands specified in the model and potential files. The way to go about with the commands is : look up each command in the TCAD manuals I had given you. Reading the complete manual from scratch is quite impractical. 

Once, you reach this step, I will give you a .cpp file for extracting the TCAD data and using them in a program like MATLAB for further processing. 

Also a word of Note : Right now the work function of aluminium is set at 4.7 in the parameter file, to take into account charges indirectly at the Si/SiO2 interface of our devices. But ideally, it is ~4.28. If you change the work function in the parameter file, you also have to add interface charges manually in the potential file (SD201_pot.cmd). I can help you with that later on. 

Also note that the line commenting character in "SD201_mod.cmd" is ";" and "SD201_pot.cmd" is "#".

Regards,
Fahd

To the file ".bashrc" (present in the directory where you log into), you will also need to add the line

export HOOPS_PICTURE=$DISPLAY

Fahd