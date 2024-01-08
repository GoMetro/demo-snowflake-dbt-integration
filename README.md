# demo-snowflake-dbt-integration

Repository to demo a dbt core workflow with snowflake.

Tutorial sources:
 - [dbt quickstart](https://quickstarts.snowflake.com/guide/accelerating_data_teams_with_snowflake_and_dbt_cloud_hands_on_lab/#0)
 - [video tutorial](https://www.youtube.com/watch?v=84RA7TuhCpg&t=587s&ab_channel=SnowflakeDevelopers)


## Architecture and Use Case Overview

The objective of this lab is to transform raw retail data into a consumable orders model that's ready for analysis.

We'll be utilizing the TPC-H dataset that comes out of the box with your Snowflake account and transform it using some of dbt's most powerful features.

<img src="repo_resources/readme_resources/00_01_architecture_ and_use_case_overview.png" width="600" align="centre">

The final deliverable for this exercise is:
- a fully functional dbt project with testing and documentation,
- experience with the dbt git workflow, 
- and dedicated development and production environments in Snowflake

here's the model lineage expected from this exercise.

<img src="repo_resources/readme_resources/00_02_model_lineage.png" width="600" align="centre">

**NB!**

Note for implementing the dbt git workflow in professional settings: 

- It may be required to write scripts to automate executions (avoid manual executions all the time)
- These scripts will likely need to include instructions on how to decide whether to continue or not.
- more effort is required to incude scheduling the execution, storing the execution results, storing logs, and publishing the freshness checks or documentation
- more effort is required to use VCS to effectively keep synchronization between environments and facilitate collaboration between the developers.
- more effort is required to display data lineage