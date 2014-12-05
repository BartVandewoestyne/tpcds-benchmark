#!/bin/bash
#
# Generate data for the TPC-DS benchmark.  Depending on the settings in
# tpcds-env.sh, the data will be generated in parallel chunks or not.

source tpcds-env.sh

cd "${TPCDS_DIR}/tools"

mkdir -p $LOCAL_DATA_DIR/scale_factor_$SF

if [ "$PARALLEL" = "true" ]; then
  echo -n "Generating TPC-DS data in parallel..."
  for (( chunk=1; chunk<=$NBCHUNKS; ++chunk ))
  do
    ./dsdgen -dir $LOCAL_DATA_DIR/scale_factor_$SF -scale $SF \
             -parallel $NBCHUNKS -child $chunk &
  done
  wait
  echo "done."
else
  echo -n "Generating TPC-DS data..."
  ./dsdgen -dir $LOCAL_DATA_DIR/scale_factor_$SF -scale $SF
  echo "done."
fi
