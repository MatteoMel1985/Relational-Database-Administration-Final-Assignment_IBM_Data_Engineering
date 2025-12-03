![Skills_Network](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-PY0221EN-Coursera/images/image.png)  

# Final Assignment - Database Administration - Part 1  

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
