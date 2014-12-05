#!/bin/bash
#
# Drop the metastore tables.

source tpcds-env.sh

export dbname="${DB}_scale_factor_${SF}"

hive -f hive/drop_tables.hql
