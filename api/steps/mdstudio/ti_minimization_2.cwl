cwlVersion: v1.0

class: CommandLineTool
arguments: ["gmx_mpi", "mdrun"]
stdout: minimization_2.out
stderr: minimization_2.err

inputs:
  openmp_threads:
    type: int
    inputBinding:
      position: 1
      prefix: -ntomp      
  name_min:
    type: string 
    inputBinding:
      position: 2
      prefix: -deffnm

outputs:
  output_min_gro:
    type: File
    outputBinding:
      glob: "$(inputs.name)*gro"
  output_min_out:
    type: File
    outputBinding:
      glob: minimization_2.out
  output_min_err:
    type: File
    outputBinding:
      glob: minimization_2.err
