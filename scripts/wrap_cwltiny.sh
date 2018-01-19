#!/bin/bash

# load a python3 module                                                                                                                       
function python_module  {
    # search for available python modules
    xs=$(module avail python 2>&1 | grep python)
    # split string into an array
    IFS=' ' read -r -a array <<<  $xs
    # Iterate over the available modules
    for x in ${array[*]}; do
	# Select a python 3 module
        if [[ $x =~ ^python/3.[4-6]. ]]; then
        PYTHONMODULE=$x
        break
        fi
    done
}

python_module
module load $PYTHONMODULE

python3 $HOME/.cerise/api/files/cerise/cwltiny.py $*

