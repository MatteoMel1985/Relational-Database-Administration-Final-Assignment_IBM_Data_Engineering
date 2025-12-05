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

## ***Task 2.3.2 - Create an index***  

Run the following SQL command to created an index.  

```SQL
CREATE INDEX idx_billedamount ON billdata(billedamount);
```

Take a screenshot of the output and save it as `index-creati.JPG`.  

![index-creati.JPG](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/2.3.2index-creati.JPG?raw=true)  

Optionally, if you wish to verify if the index was created, you can run the following command:

```SQL
SHOW INDEX FROM billdata;
```

## ***Task 2.3.3 - Document the improvement in query performance***  

After the index on `billedamount` is cretated, run again the SQL command

```SQL
SELECT * FROM billdata WHERE billedamount > 19999;
```

Then, take a screenshot of the result and save it as `query-indexed.JPG`.  

![query-indexed.JPG](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/2.3.3query-indexed.JPG?raw=true)  

You should notice a shorter execution time that that registered in task 2.3.1.  


## **Exercise 2.4 - Storage Engines**  

## ***Task 2.4.1 - Find supported storage engines***  

Run the following command to list the storage engines.  

```SQL
SHOW ENGINES;
```

Among the table, you may want to look if the engine `MyISAM` is supported on not.  

In the output, we can plainly see a `YES` under the table support, associated to the `MyISAM` engine. Take a screenshot of it and save it as `1storage-engines.JPG`.  

![1storage-engines.JPG](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/2.4.1storage-engines.JPG?raw=true)  

## ***Task 2.4.2 - Find the storage engine of a table***  

Run the following command to check the storage engine.  

```SQL
SHOW TABLE STATUS LIKE 'billdata';
```

And take a screenshot of its output, saving it as `2.4.2storage-engine-type.JPG`.  

![2.4.2storage-engine-type.JPG](https://github.com/MatteoMel1985/Relational-Database-Administration-Final-Assignment_IBM_Data_Engineering/blob/main/Tasks/2.4.2storage-engine-type.JPG?raw=true)  

We can see that the engine that supports `billdata` is `InnoDB`.  

## **Exercise 2.5- OPTIONAL Exercise (Non-graded) Automation of routine tasks**  

## ***Bonus Task 2.5.1 - Write a bash script that performs a backup of all the databases***  

Following is `mybackup.sh`. Ensure to change the password, the host, and the port with those shown in your `MYSQL_COMMAND`.

```Bash
#!/bin/bash

# --- 1. MySQL credentials ---
MYSQL_USER="root"
MYSQL_PASSWORD="xxxx"
MYSQL_HOST="xxxx"
MYSQL_PORT="xxxx"

# --- 2. Backup filename ---
BACKUP_FILE="all-databases-backup.sql"

# --- 3. Dump ALL databases ---
mysqldump --host=$MYSQL_HOST --port=$MYSQL_PORT \
    --user=$MYSQL_USER --password=$MYSQL_PASSWORD \
    --all-databases > $BACKUP_FILE

# --- 4. Create date-based directory ---
TODAY=$(date +"%Y%m%d")
TARGET_DIR="/tmp/mysqldumps/$TODAY"
mkdir -p "$TARGET_DIR"

# --- 5. Move backup file to the target directory ---
mv "$BACKUP_FILE" "$TARGET_DIR/"

# --- 6. Print success message ---
echo "Backup completed successfully!"
echo "Backup stored in: $TARGET_DIR/$BACKUP_FILE"
```

### ***1. MySQL Credentials***  

```bash
# --- 1. MySQL credentials ---
MYSQL_USER="root"
MYSQL_PASSWORD="xxxx"
MYSQL_HOST="xxxx"
MYSQL_PORT="xxxx"
```

* `MYSQL_USER`: The username to connect with (here: root).
* `MYSQL_PASSWORD`: The password for the user.
* `MYSQL_HOST`: The IP address or hostname of the MySQL server.
* `MYSQL_PORT`: The port MySQL listens on (default: 3306).

### ***2. Backup Filename***  

```bash
# --- 2. Backup filename ---
BACKUP_FILE="all-databases-backup.sql"
```

* Defines the name of the SQL dump file that `mysqldump` will create.
* The filename is static, but the destination folder will change each day.

### ***3. Dump ALL Databases***  

```bash
# --- 3. Dump ALL databases ---
mysqldump --host=$MYSQL_HOST --port=$MYSQL_PORT \
    --user=$MYSQL_USER --password=$MYSQL_PASSWORD \
    --all-databases > $BACKUP_FILE
```

This is the core action of the script.  

* `--host=$MYSQL_HOST`: Connects to the server specified earlier.
* `--port=$MYSQL_PORT`: Uses the correct MySQL port.
* `--user=$MYSQL_USER`: Logs in using the provided username.
* `--password=$MYSQL_PASSWORD`: Supplies the password.
* `--all-databases`: Exports EVERY database on the server.

Redirection:  

```bash
> $BACKUP_FILE
```

Sends the output to a file named:  

```bash
all-databases-backup.sql
```

If the file exists, it is overwritten.  

### ***4. Create Date-Based Directory***  

```bash
# --- 4. Create date-based directory ---
TODAY=$(date +"%Y%m%d")
TARGET_DIR="/tmp/mysqldumps/$TODAY"
mkdir -p "$TARGET_DIR"
```

4.1 Generate today’s date:  

* `date +"%Y%m%d"`: Outputs the current date in YYYYMMDD format (e.g., 20251201).
* `$( ... )`: Command substitution; stores output into TODAY.

4.2 Build the target directory path  

`TARGET_DIR="/tmp/mysqldumps/$TODAY"` Creates a folder path like: `/tmp/mysqldumps/20251201`  

4.3 Create the folder

`mkdir -p "$TARGET_DIR"`:

* `mkdir`: Creates a directory. `
* -p`: Creates parent directories if needed, and does not complain if the directory already exists.
* `"$TARGET_DIR"`: Ensures proper handling even if the path contains spaces (good practice).

### ***5. Move Backup File into the Target Directory***  

`mv "$BACKUP_FILE" "$TARGET_DIR/"`  

The `mv` command:  

* Moves the newly created SQL backup from the script’s working directory.
* Into the date-based folder created above.

### ***6. Print Success Message***  

```bash
echo "Backup completed successfully!"
echo "Backup stored in: $TARGET_DIR/$BACKUP_FILE"
```

* `echo` prints text to the terminal.
* Confirms the script completed without errors.
* Shows the exact path of the backup file to help the user find it.
