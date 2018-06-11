#!/bin/bash

CERISE_API_FILES="$1"

# shift the input array
shift 1

# Load gromacs
source ${CERISE_API_FILES}/gmxrc

GMX="$(which gmx_mpi || which gmx)"

${GMX} grompp $*
