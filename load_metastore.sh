#!/bin/bash
#
# Load the Hive metastore tables.

source tpcds-env.sh

dbname="${DB}_scale_factor_${SF}"

tabledir=$HDFS_DIR/scale_factor_${SF}

hive --define dbname=$dbname \
     --define store_dir=$tabledir/store \
     --define call_center_dir=$tabledir/call_center \
     --define catalog_page_dir=$tabledir/catalog_page \
     --define web_site_dir=$tabledir/web_site \
     --define web_page_dir=$tabledir/web_page \
     --define warehouse_dir=$tabledir/warehouse \
     --define customer_dir=$tabledir/customer \
     --define customer_address_dir=$tabledir/customer_address \
     --define customer_demographics_dir=$tabledir/customer_demographics \
     --define date_dim_dir=$tabledir/date_dim \
     --define household_demographics_dir=$tabledir/household_demographics \
     --define item_dir=$tabledir/item \
     --define income_band_dir=$tabledir/income_band \
     --define promotion_dir=$tabledir/promotion \
     --define reason_dir=$tabledir/reason \
     --define ship_mode_dir=$tabledir/ship_mode \
     --define time_dim_dir=$tabledir/time_dim \
     --define dbgen_version_dir=$tabledir/dbgen_version \
     -f hive/load_metastore.hql
