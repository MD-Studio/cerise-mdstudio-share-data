#!/bin/bash

# Run cwltiny.py using the 'cerise' python 3.6 miniconda env
. $HOME/.cerise/api/files/miniconda/etc/profile.d/conda.sh
conda activate cerise

python3.6 $HOME/.cerise/api/files/cerise/cwltiny.py $*

conda deactivate
