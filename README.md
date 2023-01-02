# DBT

Properties and advantages of DBT ----------
Modularity.
Portability
CICD
Testing
Documentation

Production grade data pipeline.
Write your code in DBT web compiler in SQL 
Transformational Version control

Project Overview : 

Testing
Pipeline
Documentation

insideairbnb/berlin/
import it into snowflake -->

Tech Stack :

DBT 
DWH --> SF (cloud based DWH)
Preset --> Managed BI tool


DBT User 
Import DATASET

------------Creating a virtual environment -----------------------------------------
1. Create a desktop folder for the course
2. pip install virtualenv --> Separate env for python project / maintain project specific dependencies
3. virtualenv venv 
4. venv\Scripts\activate

Just in case there is any restriction --> Run the Windows PowerShell as an administrator --> Set-ExecutionPolicy Unrestricted

------------Installing DBT on Windows virtual env -----------------------------------
1. Activate the virtual environemnt
2. pip install dbt-snowflake==1.2.0
3. dbt


-----------Creating a DBT Project and connect it with Snowflake ---------------------
1. dbt init <project_name>
2. 



All the credentials are saved in your machine in .dbt folder.

dbt debug


----------Install DBT power tools in VS Code setup ---------------------

DBT project.yaml is the global config file of this project.
Change the data folder to seeds
Remove last 3 lines from the global config files
remove example models



----------Models ----------------


------CTE ----------------
The results remains in memory during insert,select etc

When we define an SQL query like this ,  dbt knows we want create a view in snoflake based on the SQL query aka model.
dbt run --> Dbt will take a look into your changes and deploy them in to snowflake.

Which dbt command materializes a dbt model? --> dbt run.



---------Materializations -----------------------
How many types of materilizations

dbt run --> Everytime the table will be recreated.

reference with templates DAG --> {{ref('src_listing')}} --> Uses Jinja template tags

------incr materilization -------------

for incr materialization --> config on the top of the dbt script --> Jinja tag for setting up the config

for full refresh : dbt run --full-refresh

Materializations means one abstraction will always be there in snowflake else it will be ephemeral ,in which the logic is stored into CTE in the DBT level itself.


-----Sources and seeds ----------------

Seeds are smaller datasets present inside the seed sfolder in form of csv files.

dbt seed --> Snowflake


Sources are abstrcat on top of the input data.
sources.yml file

q. Why abstraction is important

{{source('airbnb','listings')}}

dbt complie --> to check if everything syntax / configs all are ok or not


------------source freshness ----------------------

Check or monitor point --> confirm data in the input has arrived on time or not

one way timestammp
Second way --> sources.yml file --> add additional config

command to check dbt source freshness


-----------snapshots ------------------------------

q, type -2 SCD --> Two addtional date fields from and two date

----------------tests --------------------
schema.yml

dbt test

singular tests -->These are present in the test folder with .sql extensionx

dbt test --select <select the singluar test from the test folder>
