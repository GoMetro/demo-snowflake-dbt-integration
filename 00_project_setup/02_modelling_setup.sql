-- explore users
USE ROLE SYSADMIN;
SHOW USERS;

-- my usename is 'LETZDEMO202312'

-- explore existing roles
SHOW ROLES;
SHOW GRANTS TO ROLE USERADMIN;

-- create a role
USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS DBT_EXECUTOR_ROLE
    COMMENT = 'Role for the users running DBT models';

-- assign privileges to the role
GRANT ROLE DBT_EXECUTOR_ROLE TO USER LETZDEMO202401;

SHOW ROLES;

-- prepare warehouse
USE ROLE ACCOUNTADMIN;
SHOW WAREHOUSES;

-- replace warehouse: COMPUTE_WH
DROP WAREHOUSE IF EXISTS COMPUTE_WH;
USE ROLE SYSADMIN; -- !NB! this is important for maintaining the security of objects in the account

create warehouse if not exists COMPUTE_WH
    with warehouse_size = 'XSMALL'
    auto_suspend = 60
    auto_resume = TRUE
    comment = 'Default Warehouse';

create warehouse if not exists DBT_WH_LARGE
    with warehouse_size = 'LARGE'
    auto_suspend = 60
    auto_resume = TRUE
    comment = 'Warehouse for PC DBT'
;

grant all on warehouse DBT_WH_LARGE to role DBT_EXECUTOR_ROLE;

SHOW WAREHOUSES;

-- grant privileges to the executor role
GRANT CREATE DATABASE ON ACCOUNT TO ROLE DBT_EXECUTOR_ROLE;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE DBT_EXECUTOR_ROLE;

-- use role to create a database
USE ROLE DBT_EXECUTOR_ROLE;
CREATE DATABASE DATA_ENG_DBT;

-- create dbt user
USE ROLE USERADMIN;
CREATE USER IF NOT EXISTS DBT_EXECUTOR
    COMMENT = 'User running DBT commands'
    PASSWORD = 'password123'
    DEFAULT_ROLE = DBT_EXECUTOR_ROLE
    DEFAULT_WAREHOUSE = COMPUTE_WH;

GRANT ROLE DBT_EXECUTOR_ROLE TO USER DBT_EXECUTOR;
USE ROLE DBT_EXECUTOR_ROLE;
