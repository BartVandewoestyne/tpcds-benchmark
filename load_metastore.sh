#!/bin/bash
#
# Load the Hive metastore tables.

source tpcds-env.sh

dbname="${DB}_scale_factor_${SF}"

hive --define dbname=$dbname -f hive/load_metastore.hql
