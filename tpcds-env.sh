### User configurable variables.

# Path with the official copy of the TPC-DS tools.
export TOOLPATH="/tmp/tpcds/TPC-DS v1.3.0/tools/"

# Output directory where you locally store the generated TPC-DS data.
export LOCAL_DATA_DIR=/home/$USER/tpcds_data

# HDFS root directory where all benchmark data must be stored.
export HDFS_DIR=/user/$USER/tpc-ds

# Database name
export DB="tpcds"

# Variable indicating whether dsdgen should be run in parallel or not.
export PARALLEL=false

# When running in parallel, the number of chunks that should be used. Typically
# set this to the number of cores you have available.
export NBCHUNKS=8

# TPC-DS scale factor to use.
export SF=1
