#!/bin/bash
#
# Copy the generated data to the HDFS filesystem.
#
# TODO:
#   * Find out whether we could/should use the -MoveFromLocal or -put options.

# Create HDFS directories if they do not already exist.

source tpcds-env.sh

tables=( call_center
         catalog_page
         catalog_returns
         catalog_sales
         customer_address
         customer
         customer_demographics
         date_dim
         dbgen_version
         household_demographics
         income_band
         inventory
         item
         promotion
         reason
         ship_mode
         store
         store_returns
         store_sales
         time_dim
         warehouse
         web_page
         web_returns
         web_sales
         web_site )

# Make a directory for each generated table.
hdfs dfs -mkdir -p $HDFS_DIR
for t in "${tables[@]}"
do
  echo "Making HDFS directory ${HDFS_DIR}/scale_factor_${SF}/${t}"
  hdfs dfs -mkdir -p ${HDFS_DIR}/scale_factor_${SF}/${t}

  echo "Copying data file into ${HDFS_DIR}/scale_factor_${SF}/${t}"
  hdfs dfs -copyFromLocal $LOCAL_DATA_DIR/scale_factor_${SF}/${t}*.dat ${HDFS_DIR}/scale_factor_${SF}/${t}
done
