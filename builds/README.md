# AOCC PyTorch Setup Script

This script automates the setup of the BLIS library and PyTorch with MPI support on Shaheen III using the AOCC compiler and specific environment modules. 

## Prerequisites

Ensure the following before running the script:

1. Modules: The system should support the module command to load software environments. This script specifically requires:
- PrgEnv-cray and PrgEnv-aocc for compiler environment
- aocc/4.2.0 for the AOCC compiler
- python (the exact Python module may vary)

2. Path Adjustments: Update the script with paths specific to your environment:
- MPI_HOME: Path to your MPI installation (replace /path/to/your/mpi)
- Installation directory for PyTorch: Replace /path/to/your/install/directory with your desired install path.

3. Python: Python 3 should be installed, along with pip and other necessary development tools.


## Description

This script performs the following tasks:

1. Clone and Build BLIS:
- Clones the BLIS library from GitHub.
- Configures BLIS with the AOCC compiler.
- Builds and installs BLIS to the specified directory (/scratch/badawimh/iops/sw/blis).
- Sets environment variables for BLIS so it can be used as a backend for other libraries (e.g., PyTorch).

2. Clone and Build PyTorch with MPI Support:
- Clones the PyTorch repository from GitHub with all submodules.
- Sets up the MPI environment variables and enables MPI support.
- Installs PyTorch to the specified directory.

## Usage
1. Update Paths

Before running, edit the script to specify paths for MPI_HOME and the PyTorch installation directory. Open the script in any text editor and update the placeholders:

```shell
export MPI_HOME=/path/to/your/mpi
USE_MPI=1 python3 setup.py install --prefix=/path/to/your/install/directory
export PYTHONPATH=$PYTHONPATH:/path/to/your/install/directory/lib/python3.10/site-packages/
```

2. Run the Script

To execute the script:

Make it executable (if not already):

```shell
chmod +x torch_aocc.sh
```

Run the script:

```shell
./torch_aocc.sh
```

The script will output the installation steps and prompt for any necessary module loads or configurations.
