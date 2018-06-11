cwlVersion: v1.0

class: CommandLineTool
arguments: ["source", "$CERISE_API_FILES/gmxrc", "&&", "source", "$GMXRC_MDSTUDIO", "&&",
            "gmx_mpi", "grompp"]
stdout: minimization_1.out
stderr: minimization_1.err

inputs:
  mdp_file:
    type: File
    inputBinding:
      position: 1
      prefix: -f      
  gro_file:
    type: File
    inputBinding:
      position: 2
      prefix: -c
  top_file:
    type: File
    inputBinding:
      position: 3
      prefix: -p
  tpr_file:
    type: string
    inputBinding:
      position: 4
      prefix: -o
  maxwarn:
    type: int
    default: 33
    inputBinding:
      position: 5
      prefix: -maxwarn

outputs:
  output_min_tpr:
    type: File
    outputBinding:
      glob: $(inputs.tpr_file)
  output_min_out:
    type: File
    outputBinding:
      glob: minimization_1.out
  output_min_err:
    type: File
    outputBinding:
      glob: minimization_1.err
