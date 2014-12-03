#!/bin/bash
#
# Generate data for the TPC-DS benchmark.
source tpcds-env.sh

cd "${TOOLPATH}"

mkdir -p $LOCAL_DATA_DIR/SCALE_FACTOR_$SF

if [ "$PARALLEL" = "true" ]; then
  echo -n "Generating TPC-DS data in parallel..."
  for (( chunk=1; chunk<=$NBCHUNKS; ++chunk ))
  do
    ./dsdgen -dir $LOCAL_DATA_DIR/SCALE_FACTOR_$SF -scale $SF -parallel $NBCHUNKS -child $chunk &
  done
  wait
  echo "done."
else
  echo -n "Generating TPC-DS data..."
  ./dsdgen -dir $LOCAL_DATA_DIR/SCALE_FACTOR_$SF -scale $SF
  echo "done."
fi
