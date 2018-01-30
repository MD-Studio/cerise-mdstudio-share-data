#!/bin/bash

CERISE_API_FILES="$1"
LIGAND_PDB="$2"
LIGAND_TOP="$3"

# Remove the CERISE_API_FILES, lIGAND_PDB and LIGAND_TOP
# items from the input array
shift 3

source $CERISE_API_FILES/miniconda/bin/activate root

# load GMXRC_MDSTUDIO PATH
. $GMXRC_MDSTUDIO
GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-share-data/mdstudio/gromit/gromit_mpi.sh"

# perform a normal MD protein-ligand simulation
$GROMIT -gmxrc $GMXRC_MDSTUDIO -np 8 -vsite -lie -l $LIGAND_PDB,$LIGAND_TOP $*
