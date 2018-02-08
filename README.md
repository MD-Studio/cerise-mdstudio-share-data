# Instructions to create a new specialization

This repository contains all the static configuration that
is generic to all the computer resources in order to
carry out the MD simulations with the **MDStudio** infrastucture
and Gromacs.

**Note:** This is work in progress.

In order to create a new specialization you need to create the following files (and folder) which content and function is explained in detail below,

* api/config.yml
* api/install.sh
* api/files/gmxrc
* known_hosts
* Dockerfile

### api/config.yml
This file contains all the [cerise](http://cerise.readthedocs.io/en/latest/configuration.html#compute-resource-configuration) configuration options necessary to run a job in a remote machine. **Do not put any password in this file**, instead use environmental variables. see the [DAS5 config file](https://github.com/MD-Studio/cerise-mdstudio-das5/blob/develop/api/config.yml) for an example.

### api/install.sh
This file is a bash script containing the commands to install all the infrastucture of *cerise*, [miniconda](https://conda.io/docs/) and all files related to the MD simulation. In the current repository we have a general installation script that can be used as shown by the [DAS5 installation script](https://github.com/MD-Studio/cerise-mdstudio-das5/blob/develop/api/install.sh).

We assume that Gromacs is installed in the computational infrasctucture that you intend to use or you can compile and install gromacs in this step.
In the [DAS5 specialization](https://github.com/MD-Studio/cerise-mdstudio-das5) we compiled Gromacs and stored it in the same repository of the specialization and we clone the binaries during the installation.

### api/files/gmxrc
This plain text file contains an environmental variable call **GMXRC_MDSTUDIO** pointing to the absolute path of the **GMXRC.bash** file of Gromacs. Also, it contains all the calls to the [environment modules] required to call Gromacs. See the 
[DAS5 gmxrc](https://github.com/MD-Studio/cerise-mdstudio-das5/blob/develop/api/files/gmxrc) for an example.

### known_hosts
This file contains the public key of the host that you want to communicate with. for a detail explanation see the [client configuration file](https://en.wikibooks.org/wiki/OpenSSH/Client_Configuration_Files).

### Dockerfile
[cerise specializations](http://cerise.readthedocs.io/en/latest/index.html) are [docker containers](https://www.docker.com/what-docker) in charge of managing the jobs execute in a remote machine. These containers take care of submitting, monitoring and retrieving all the job-related data for a given molecular dynamics simulation.
For most of the application you just need to copy paste the reference [DAS5 Dockerfile](https://github.com/MD-Studio/cerise-mdstudio-das5/blob/develop/Dockerfile) into your specialization Dockerfile.


## Legal Notes

### gromit

This repository contains a modified copy of gromit.sh from
[gromit](https://github.com/Tsjerk/gromit) in
api/files/mdstudio/gromit/gromit_mpi.sh. Gromit is licensed under the GNU
General Public License version 2.0 (see the file LICENSE_GROMIT).

### Other files

The rest of this repository is covered by the following license grant:

   Copyright 2018 Netherlands eScience Center and VU University Amsterdam

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
