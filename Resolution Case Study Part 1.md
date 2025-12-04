<h1 align="center">Part 1 - Exercise 1.1</h1>

Start the PostgreSQL server by clicking on the Explorer icon in the left pane, then select Databases, then PostgreSQL, and finally, click on the Create button.

![screenshot 5](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Images/Screenshot%205.png?raw=true)  

If a terminal is not yet open, click on Terminal in the upper menu bar and select New Terminal.

![Screenshot 4](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Images/Screenshot%204.png?raw=true)  

Ensure that the path shown in the command ends with `/home/project$`, then, write the following command and press enter.

```Bash
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/-o-CVNqamn9K4hGlSpFCYg/postgres-setup.sh
```

While downloading, you might encounter the following error.

![error example](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/gFtBFwyaqfH4R_mNkIllUg/u-Bd8tKBQfq5uKvVv2feLg-2cb23b99295a4633ab7cc87f49a130e1-error-message.png)  

To resolve it, you need to edit the PostgreSQL file as follows:  

* Start the PostgreSQL server. Once it shows as active, switch to the credentials tab and copy the server password.
* Open the downloaded file from the left panel in the file section.
* Enter the password in the specified area (which you will find in PostgreSQL > Connection Information > POSTGRES_PASSWORD:).

![error resolution](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/KsHxHOXR6CwM_vRClCtEsA/Screenshot%202024-10-22%20132154.png)  

* Go to file to save the changes.

![save](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/5uS8SoVP7HX9S57PEfna0A/Screenshot%202024-10-22%20133525.png)  

* Run the bash file by typing the following command on the terminal.

```Bash
bash postgres-setup.sh
```  

Once launched, the terminal should appear as in the image.  

![Screenshot 1](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Relational%20Database%20Management/Screenshot%201.png?raw=true)  

## ***Task 1.1 - Find the settings in PostgreSQL***  

Type the following command from the terminal, and ensure to copy and paste the `POSTGRES_PASSWORD` of your current session (found in PostgreSQL > Connection Information > POSTGRES_PASSWORD:)  

```bash
export PGPASSWORD="TYPE YOUR POSTGRES_PASSWORD HERE"
psql --username=postgres --host=postgres
```

You should now get a new prompt appearing like  

```bash
psql --username=postgres --host=postgres
psql (14.19 (Ubuntu 14.19-0ubuntu0.22.04.1), server 13.2)
Type "help" for help.

postgres=#
```

Now, after the prompt `postgres=#`, type

```SQL
SHOW max_connections;
```

The following image shows the result in the terminal, and it is also the screenshot `max-connections.jpg`.  

![max-connections.jpg](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/1.1max-connections.jpg?raw=true)  

## ***Task 1.2 - Create a User***  

Open the PostgreSQL CLI as shown in the image, and ensure to perform the tasks 1.2 to 1.5 using the PostgreSQL CLI.  

![PostgreSQL CLI](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/LfZzB4RxZ1UC8wmNDe1keQ/1.png)  

After the prompt `postgres=#`, type the following SQL command.  

```SQL
CREATE USER backup_operator;
```

Take a screenshot of the command and its result and save it as `backup_operator.JPG`.  

![backup_operator.JPG](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/1.2backup_operator.JPG?raw=true)  

## ***Task 1.3 - Create a Role***  

After the prompt `postgres=#`, type the following SQL command.  

```SQL
CREATE ROLE backup;
```

This will produce the out  

```SQL
CREATE ROLE
```

Take a screenshot of the command and its result and save it as `create-role.jpg`.  

![create-role.jpg](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/1.3create-role.JPG?raw=true)  

## ***Task 1.4 - Grant privileges to the role***  

Due to an SQL error, I noticed that, despite the file `postgres-setup.sh` was run, the SCEMA `toll` was not created, therefore, we will have to create it manually by running the following command.

```SQL
CREATE SCHEMA toll;
```

Now, we can finally proceed to grant priviledges to role `backup`, by running the two following SQL lines.

```SQL
GRANT CONNECT ON DATABASE tolldata TO backup;
```

And 

```SQL
GRANT SELECT ON ALL TABLES IN SCHEMA toll TO backup;
```

Finally, we can take a screenshot of the command and its result and save it as `grant-privs-to-role.jpg`.  

![grant-privs-to-role.jpg](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/1.4grant-privs-to-role.JPG?raw=true)  

## ***Task 1.5 - Grant role to an user***  

Run the following command from the CLI to grant role `backup` to the user `backup_operator`.  

```SQL
GRANT backup TO backup_operator;
```

Once run, the user now inherits all privileges of the `backup` role.

Now, we can take a screenshot of the command and its result and save it as `grant-role.jpg`.  

![grant-role.jpg](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/1.5grant-role.JPG?raw=true)  

## ***Task 1.6 - Backup a database on PostgreSQL server***  

Open pgAdmin page by clicking the following button.

![Screenshot 2](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Relational%20Database%20Management/Screenshot%202.png?raw=true)

Once prompted on the portal, click on Servers in the upper-left pane of the screen, and insert the password, then click OK.

![Screenshot 3](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Relational%20Database%20Management/Screenshot%203.png?raw=true)  

On the left pane, click `Servers → PostgreSQL → Databases`, then, right click `tolldata` and select `Backup...`.

![Screenshot 4](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Relational%20Database%20Management/Screenshot%204.png?raw=true)  

Click on the folder icon at the right side of the label `Filename`, then, once prompted to the `Select file` window, click on the upper arrow icon on the upper-left side, and select the path `/var/lib/pgadmin`.

!Screenshot 5](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Relational%20Database%20Management/Screenshot%205.png?raw=true)  

Then, click on `Create`. 

We will be prompted back to the Backup window. Click on the Format lable, and select `Tar`, then, click on the button `Backup` on the lower right side. 

![backup-database](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/1.6backup-database.JPG?raw=true)  

Finally, we can take a screenshot of the command and its result and save it as `backup-database.jpg`.  
