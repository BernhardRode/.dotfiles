export PATH=$HOME/bin:/usr/local/bin:$PATH

# Anaconda3 
export PATH="/Users/ebbo/Applications/anaconda3/bin:$PATH"

# Cuda 
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"