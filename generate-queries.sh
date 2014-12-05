#!/bin/bash
#
# Generate all the queries and output them as individual files in the
# hive/queries/scale_factor_X directory.

source tpcds-env.sh

rm -rf queries/${SF}
mkdir -p queries/${SF}

${TPCDS_DIR}/tools/dsqgen -INPUT ${TPCDS_DIR}/query_templates/templates.lst \
                          -DIRECTORY ${TPCDS_DIR}/query_templates \
                          -SCALE ${SF} \
                          -DIALECT hive \
                          -OUTPUT_DIR queries/${SF} \
                          -STREAMS 1 \
                          -DISTRIBUTIONS ${TPCDS_DIR}/tools/tpcds.idx

./split_queryfile.awk queries/${SF}/query_0.sql

mkdir -p hive/queries/scale_factor_${SF}
mv query_[0-9][0-9].hql hive/queries/scale_factor_${SF}
