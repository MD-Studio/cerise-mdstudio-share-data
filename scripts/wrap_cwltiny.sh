#!/bin/bash

# load a python3 module                                                                                                                       
function python_module  {
    # search for available python modules
    xs=$(module avail 2>&1 | grep python)
    # split string into an array
    IFS=' ' read -r -a array <<<  $xs
    # Iterate over the available modules
    for x in ${array[*]}; do
        # Select a python 3 module
        if [[ $x =~ python/3.[4-6]. ]]; then
            PYTHONMODULE=$x
            break
        fi
    done
    echo $PYTHONMODULE
}

function python_executable {
    array=( "3" "3.4" "3.5" "3.6")
    for x in ${array[*]}; do
        var=$(command -v python${x})
        if [[ ! -z $var ]]; then
            echo $var
            break
        fi
    done
}

# Load any python3 module avaialablr
PYTHONMODULE=$(python_module)
module load $PYTHONMODULE
# Select a python 3 executable
PYTHON3=$(python_executable)
$PYTHON3 $HOME/.cerise/api/files/cerise/cwltiny.py $*
