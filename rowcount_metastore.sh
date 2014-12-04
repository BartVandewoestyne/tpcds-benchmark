#!/bin/bash
#
# Do a row count on all tables of the Hive metastore tables.

source tpcds-env.sh

dbname="${DB}_scale_factor_${SF}"

hive --define dbname=$dbname -f hive/row_count.hql

> rowcounts.txt
find rowcounts -name 000000_0 | sort | xargs cat >> rowcounts.txt
