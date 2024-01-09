use role SYSADMIN;
use warehouse COMPUTE_WH;

select *
from snowflake_sample_data.tpch_sf1.orders
limit 100;
