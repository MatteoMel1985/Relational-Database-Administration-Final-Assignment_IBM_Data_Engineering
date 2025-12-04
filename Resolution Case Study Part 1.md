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

* Run the bash file.

## ***Task 1.1 - Find the settings in PostgreSQL***  

