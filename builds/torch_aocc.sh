# Build PyTorch 2.2 in PrgEnv-aocc environment.
#!/bin/bash

# Clone the BLIS library
git clone https://github.com/flame/blis.git
cd blis || exit

# Load necessary modules for AOCC
module swap PrgEnv-cray PrgEnv-aocc
module load aocc/4.2.0
module load python

# Configure, make, and install BLIS
CC=/sw/ex109genoa/AMD/aocc/4.2.0/bin/clang
CXX=/sw/ex109genoa/AMD/aocc/4.2.0/bin/clang++
CC_VENDOR=aocc ./configure --prefix=/scratch/badawimh/iops/sw/blis zen3
make
make install

# Set BLIS environment variables
export BLIS_LIB_DIR=/scratch/badawimh/iops/sw/blis/lib
export BLIS_INCLUDE_DIR=/scratch/badawimh/iops/sw/blis/include 
export LD_LIBRARY_PATH=$BLIS_LIB_DIR:$LD_LIBRARY_PATH
export CC=/sw/ex109genoa/AMD/aocc/4.2.0/bin/clang
export CXX=/sw/ex109genoa/AMD/aocc/4.2.0/bin/clang++
export BLAS=BLIS 
export BLIS_HOME=/scratch/badawimh/iops/sw/blis

# Go back to the root directory and clone PyTorch
cd ..
git clone --recursive https://github.com/pytorch/pytorch
cd pytorch || exit

# Update submodules
git submodule update --init --recursive

# Set MPI environment variables
export MPI_HOME=/path/to/your/mpi
export PATH=$MPI_HOME/bin:$PATH 
export LD_LIBRARY_PATH=$MPI_HOME/lib:$LD_LIBRARY_PATH

# Install PyTorch with MPI support
USE_MPI=1 python3 setup.py install --prefix=/path/to/your/install/directory

# Update PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/path/to/your/install/directory/lib/python3.10/site-packages/
