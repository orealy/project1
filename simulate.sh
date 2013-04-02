#!/bin/bash

# Stop script if any command fails.
set -e

DEVISE_SCRIPT="structure.scm"
BASE_NAME="quad"
DESSIS_COMMANDS="settings_des.cmd"

devise -l -e $DEVISE_SCRIPT
mesh -P $BASE_NAME
dessis $DESSIS_COMMANDS

echo "Done!"
echo "Run techplot_sie $(BASE_NAME)_des.dat $(BASE_NAME)_msh.grd to view."
