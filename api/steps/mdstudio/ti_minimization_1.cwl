cwlVersion: v1.0

class: CommandLineTool
arguments: ["$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-share-data/mdstudio/ti/minimization_1.sh", "$CERISE_API_FILES"]
stdout: minimization.out
stderr: minimization.err

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
