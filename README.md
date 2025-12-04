![Skills_Network](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-PY0221EN-Coursera/images/image.png)  

<h1 align="center">Final Assignment - Database Administration - Part 1</h1>

# ***Scenario***  

You have assumed the role of database administrator for the PostgreSQL server and you will perform the User Management tasks and handle the backup of the databases.  

# ***Objectives***  

In Part 1 of this assignment you will be working on the following aspects of Database Administration.  

*  Installation/Provisioning
*  Configuration
*  User Management
*  Backup

## ***Exercise 1.1 - Set up the lab environment***  

Before you proceed with the assignment  

* Start the PostgreSQL Server
* Download the lab setup bash file "postgres-setup.sh" from the following URL: [https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/-o-CVNqamn9K4hGlSpFCYg/postgres-setup.sh](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/-o-CVNqamn9K4hGlSpFCYg/postgres-setup.sh)

While downloading, you might encounter the following error.

![Error image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/gFtBFwyaqfH4R_mNkIllUg/u-Bd8tKBQfq5uKvVv2feLg-2cb23b99295a4633ab7cc87f49a130e1-error-message.png)  

To resolve it, you need to edit the PostgreSQL file as follows:  

* Start the PostgreSQL server. Once it shows as active, switch to the credentials tab and copy the server password.
* Open the downloaded file from the left panel in the file section.
* Enter the password in the specified area.

![Postgres image](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/KsHxHOXR6CwM_vRClCtEsA/Screenshot%202024-10-22%20132154.png)  

* Go to file to save the changes.

![Save Changes](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/5uS8SoVP7HX9S57PEfna0A/Screenshot%202024-10-22%20133525.png)  

* Run the bash file

## ***Task 1.1 - Find the settings in PostgreSQL***  

What is the maximum number of connections allowed for the postgres server on theia lab? 

> Hint: Use the **show** command.

Take a screenshot of the config file that clearly shows this information.
Name the screenshot as **max-connections.jpg** (images can be saved with either `.jpg` or `.png` extension).

## ***Exercise 1.2 - User Management***  

Perform these user management tasks on your PostgreSQL server.
Perform the tasks 1.2 to 1.5 using the PostgreSQL CLI. DO NOT USE THE PGADMIN GUI.  

![PostgreSQL GUI](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/LfZzB4RxZ1UC8wmNDe1keQ/1.png)  

## ***Task 1.2 - Create a User***  

Create a user named `backup_operator`.  
Take a screenshot of the command you used and the output.
Name the screenshot as **create-user.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## ***Task 1.3 - Create a Role***  

Create a role named `backup`.
Take a screenshot of the command you used and the output.
Name the screenshot as **create-role.jpg** (images can be saved with either `.jpg` or `.png` extension).

## ***Task 1.4 - Grant privileges to the role***  

Grant the following privileges to the `backup` role.

* CONNECT ON DATABASE tolldata .
* SELECT ON ALL TABLES IN SCHEMA toll.

Take a screenshot of the command you used and the output.
Name the screenshot as **grant-privs-to-role.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## ***Task 1.5 - Grant role to an user***  

Grant the role `backup` to `backup_operator`.
Take a screenshot of the command you used and the output.
Name the screenshot as **grant-role.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## Exercise 1.3 - Backup  

## ***Task 1.6 - Backup a database on PostgreSQL server***  

Backup the database `tolldata` using PGADMIN GUI.
Backup the database `tolldata` into a file named `tolldatabackup.tar`, select the backup format as `Tar`
Take a screenshot of the window that shows the filename and format you have specified.
Name the screenshot as **backup-database.jpg** (images can be saved with either `.jpg` or `.png` extension).  

**End of assignment - Part 1.**

<h1 align="center">Final Assignment - Database Administration - Part 2</h1>  

# ***Scenario***  

You have assumed the role of database administrator for the MySQL server and will perform the tasks like configuration check, recovery of data. You will use indexing to improve the database performance. You will identify which storage engines are supported by the server and which table uses which storage engine. Optionally You will also automate backup tasks.  

# ***Objectives***  

In part 2 of this assignment you will be working on the following aspects of Database Administration.

* Installing/Provisioning
* Configuration
* Recovery
* Indexing
* Storage Engines
* Automation of routine tasks

## Exercise 2.1 - Set up the lab environment  

## ***Task 2.2.1- Restore MySQL server using a previous backup***  

Download the backup file [https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/Final%20Assignment/billingdata.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/Final%20Assignment/billingdata.sql).  

Restore this file onto MySQL server.
List the tables in the `billing` database.
Take a screenshot of the list of tables.
Name the screenshot as **database-restore.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## ***Task 2.2.2 - Find the table data size***  

Find the data size of the table `billdata`.
Take a screenshot of the command you used and the output.
Name the screenshot as **table-data-size.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## Exercise 2.3 - Indexing  

## ***Task 2.3.1 - Baseline query performance***  

Write a query to select all rows with a billedamount > 19999 in table `billdata`.
Take a screenshot of the command you used and the output along with the query time.
Name the screenshot as **query-base-line.jpg** (images can be saved with either `.jpg` or `.png` extension).  


## ***Task 2.3.2 - Create an index*** 

Your customer wants to improve the execution time of the query you wrote in Task 2.3.
Create an appropriate index to make it run faster.
Take a screenshot of the command you used and the output.
Name the screenshot as **index-creation.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## ***Task 2.3.3 - Document the improvement in query performance***  

Find out if the index has any impact on query performance.
Re-run the baseline query of Task 2.3.1 after creating the index.
Take a screenshot of the command you used and the output along with the query time.
Name the screenshot as **query-indexed.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## Exercise 2.4 - Storage Engines  

## ***Task 2.4.1 - Find supported storage engines***  

Run a command to find out if your MySQL server supports the `MyISAM` storage engine.
Take a screenshot of the command you used and the output.
Name the screenshot as **storage-engines.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## ***Task 2.4.2 - Find the storage engine of a table***  

Find the storage engine of the table `billdata`.
Take a screenshot of the command you used and the output.
Name the screenshot as **storage-engine-type.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## Exercise 2.5- OPTIONAL Exercise (Non-graded) Automation of routine tasks  

## ***Bonus Task 2.5.1 - Write a bash script that performs a backup of all the databases***  

`mysqldump` is a command line tool that performs logical backups of a database.
Its generic syntax is `mysqldump db_name > backup-file.sql`
Its extended syntax is `mysqldump --all-databases --user=root --password=NzA4Ny1y > backup-file.sql`
Write a bash script named mybackup.shthat performs the following tasks.

* Perform the backup of all databases using the mysqldump
* Store the output in the file all-databases-backup.sql
* In the /tmp directory, create a directory named after current date like YYYYMMDD. For example, 20210830
* Move the file all-databases-backup.sql to `/tmp/mysqldumps/<current date>/` directory

Take a screenshot of the bash script with the entire code clearly visible.
Name the screenshot as **bash-script.jpg** (images can be saved with either `.jpg` or `.png` extension).  

**End of assignment - Part 2.**

<h1 align="center"><h1 align="center">Final Assignment - Database Administration - Part 3</h1></h1>  

# ***Scenario***  

You have been assigned the work on Datasette and perform the tasks like restoration of data and index creation to improve the query performance. You will create views to make queries easier to write.  

# ***Objectives***  

In part 3 of this assignment, you will be working on the following aspects of Database Administration.

* Restore data
* Indexing
* View creation

# ***Dataset Used in this Lab***  

The dataset used in this lab is [billing.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/Final%20Assignment/billing.csv?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDB0231ENSkillsNetwork26763093-2022-01-01).  

## Exercise 3.1 - Restore data

## ***Task 3.1 - Restore the table billing***  

Use the `billing.csv` and restore the CSV file into a table named `billing`. Write a query to display the total number of rows imported.
Take a screenshot of the SQL statements you used and the output.
Name the screenshot as **restore-table.jpg** (images can be saved with either `.jpg` or `.png` extension).  

<details>
<summary>click here for hint</summary>

To print the number of imported rows, use the **count** function.
</details>

## Exercise 3.2 - Create a view  

## ***Task 3.2 - Create a view named basicbilldet***  

Take a screenshot of the SQL statement used to create the view.
Name the screenshot as **create-view.jpg** (images can be saved with either `.jpg` or `.png` extension).  

## Exercise 3.3 - Indexing 

## ***Task 3.3 - Baseline query performance***  

Write a query to find out all the rows with a billing amount of 19929.
Hint: Use the command `SELECT strftime(“%Y-%m-%d %H:%M:%f”, “now”);` before and after your query to display the run time.
**Note**: There will not be much difference in the run time as the number of records is less for the above-given condition.
Take a screenshot of the command you used, along with the query run time.
Name the screenshot as **query-base-line.jpg** (images can be saved with either `.jpg` or `.png` extension). If you find it difficult to capture the entire screen in a single screenshot, please capture only the results section showing the commands you used and the output.  

## ***Task 3.4 - Create an index***  

Create an index that can make the query in the previous task faster. Name the index as `billingamount`.
Take a screenshot of the SQL statement you used and the output.
Name the screenshot as **index-creation.jpg** (images can be saved with either `.jpg` or `.png` extension). 

## ***Task 3.5 - Document the improvement in query performance***  

Find out if the index has any impact on query performance.
Re-run the query to find out all the rows with a billing amount of 19929.
Take a screenshot of the command you used, the output, and the query run time.
You will NOT be evaluated on the query run time. However, you are encouraged to run the query multiple times and pick the result with the lowest query run time.
Name the screenshot as **query-after-index.jpg** (images can be saved with either `.jpg` or `.png` extension). If you find it difficult to capture the entire screen in a single screenshot, please capture only the results section showing the commands you used and the output. 

**End of assignment - Part 3.**  

# Author
# ***[Matteo Meloni](https://www.linkedin.com/in/matteo-meloni-40a357154/)***
