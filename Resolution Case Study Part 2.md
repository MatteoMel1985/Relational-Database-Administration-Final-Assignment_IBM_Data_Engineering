<h1 align="center">Part 2 - Exercise 2.1</h1>  

Start the MySQL environment by clicking on the `Explorer pane > Databases > MySQL > Create`.  

## ***Task 2.2.1- Restore MySQL server using a previous backup***  

Open a terminal (if not yet present) by clicking on the top menu bar `Terminal > New Terminal` and ensure that the path shown looks as follows  

```Bash
theia@theiadocker-xxxx:/home/project$
```

If it’s in another directory, run:  

```bash
cd /home/project
```

To download `billingdata.sql`, run the following command in the terminal.

```bash
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/Final%20Assignment/billingdata.sql"
```

Nou should now have a file called `billingdata.sql` in `/home/project`. You can quickly check with.  

```bash
ls
```

Which should result in the terminal showing `billingdata.sql` listed. 

To connect to MySQL, copy the `MYSQL_COMMAND` you can find in `MySQL label > Connection and Information > MYSQL_COMMAND`, inclusive of your own password.

![Screenshhot 7](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Relational%20Database%20Management/Screenshot%207.png?raw=true)  

Since we want to run the restore command, rewrite it as follows, and run it from your terminal. 

```bash
mysql --host=xxxx --port=xxxx --user=root --password=xxxx < billingdata.sql
```

If the command succeeds, you won’t see much output (maybe just a new shell prompt). That’s normal. Now, we want to connect to MySQL and check the `billing` database, therefore, we will have to run again the `MYSQL_COMMAND`. 

```bash
mysql --host=xxxx --port=xxxx --user=root --password=xxxx
```

You should see a `mysql>` prompt.

To verify if the `billing` database is loaded, you can run the following SQL command.

```SQL
SHOW DATABASES;
```

If the database were loaded correctly, a similar response should appear.  

![Screenshot 6](https://github.com/MatteoMel1985/Relational-Dataset-Images/blob/main/Relational%20Database%20Management/Screenshot%206.PNG?raw=true)  

Now, `SELECT` the billing database. 

```SQL
USE billing;
```  

You should see `Database changed` in the terminal.  

Finally, to list the tables in billing, run  

```SQL
SHOW TABLES;
```

Take a screenshot of the output and save it as `2.2.1database-restore.JPG`. 

![2.2.1database-restore.JPG](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/2.2.1database-restore.PNG?raw=true)




