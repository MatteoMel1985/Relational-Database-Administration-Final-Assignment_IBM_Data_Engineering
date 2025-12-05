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

## ***Task 2.2.2 - Find the table data size***  

To find the table data size, we must first select the billing database by running.  

```SQL
USE billing;
```

The terminal will show `Database changed`. Finally, we can run the following SQL query that shows the table size.  

```SQL
SELECT 
    table_name,
    ROUND(data_length / 1024, 2) AS data_size_kb,
    ROUND(index_length / 1024, 2) AS index_size_kb,
    ROUND((data_length + index_length) / 1024, 2) AS total_size_kb
FROM information_schema.tables
WHERE table_schema = 'billing'
  AND table_name = 'billdata';
```

The `SELECT` clause specifies the columns you want to retrieve in the resulting set:  

* `table_name` is the name of the table being queried. In this case, it will return `'billdata'`.

* `ROUND(data_length / 1024, 2) AS data_size_kb`:

  * `data_length`: A column from the `information_schema.tables` that holds the physical size of the table data in bytes.
  * The calculation performs the conversion from bytes to kilobytes
  * `AS data_size_kb`: This alias gives the resulting calculated column a descriptive name.
 
* `ROUND(index_length / 1024, 2) AS index_size_kb`:

  * `index_length`: A column that holds the physical size of the table's indexes in bytes.
  * The calculation converts this index size from bytes to kilobytes.
  * `AS index_size_kb`: This alias gives the resulting column a descriptive name.

* `ROUND((data_length + index_length) / 1024, 2) AS total_size_kb`:

  *  This is the sum of the data size and the index size, representing the total storage size consumed by the table.
  *  The calculation converts this total size from bytes to kilobytes.
  *  `AS total_size_kb`: This alias gives the resulting column a descriptive name.
 
* `FROM information_schema.tables`: This specifies the source of the data.
* `WHERE table_schema = 'billing'`: This filters the results to only include tables that belong to the database (schema) named `'billing'`.
* `AND table_name = 'billdata'`: This further filters the results to the specific table named `'billdata'` within the `'billing'` schema.

### **Division by 1024**  

Computer storage sizes are typically based on powers of 2. While a kilobyte in the decimal system is $1,000$ bytes, in the binary system (which is used for computer memory and storage addressing), a kilobyte (KB) is defined as $2^{10}$ bytes, which equals $1,024$ bytes.  
The division converts the original value in bytes (e.g., data_length) to kilobytes (KB).  

* `ROUND(value, decimal_places)`:

  * `ROUND()` function is a standard SQL function that is used to round a number to a specified number of decimal places.
  * The parameter `2` specifies that the result of the division (data_length / 1024) should be rounded to two decimal places (e.g., $1024.5678$ would become $1024.57$).
 
Once the SQL command is run, take a screenshot of the output and save it as `table-data-size.jpg`.

![table-data-size.jpg](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/2.2.2table-data-size.JPG?raw=true)   

## **Exercise 2.3 - Indexing**  

## ***Task 2.3.1 - Baseline query performance***

To show the query execution time in MySQL, run the following command.  

```SQL
SET profiling = 1;
```

Then, finally, run this SQL query to see where the `billedamount` is more than 19999 in `billdata`.  

```SQL
SELECT *
FROM billdata
WHERE billedamount > 19999;
```

Once the SQL command is run, take a screenshot of the output and save it as `query-base-line.jpg`.  

![query-base-line.jpg](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/2.3.1query-base-line.JPG?raw=true)  





