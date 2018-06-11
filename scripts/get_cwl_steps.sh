#!/bin/bash

files=("decompose.cwl" "energies.cwl" "gromit.cwl" "ti_minimization_1.cwl" "ti_minimization_2.cwl")

REPO="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/ti/api/steps/mdstudio"

for f in ${files[*]}; do
    wget $REPO/$f  -P "api/steps/mdstudio"
done
