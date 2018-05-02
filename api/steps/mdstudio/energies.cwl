cwlVersion: v1.0

class: CommandLineToolv
arguments: ["$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-share-data/mdstudio/energies/call_getenergies.sh", "$CERISE_API_FILES"]
stdout: getEnergy.out
stderr: getEnergy.err

inputs:
  edr:
    type: File
    inputBinding:
      position: 1
      prefix: -edr

outputs:
  energy_dataframe:
    type: File
    outputBinding: { glob: "energy.ene" }
  energyout:
    type: File
    outputBinding: { glob: getEnergy.out }
  energyerr:
    type: File
    outputBinding: { glob: getEnergy.err }   
