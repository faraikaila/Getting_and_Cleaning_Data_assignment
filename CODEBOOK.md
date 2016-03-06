The script combines the datasets provided, to put together the testing and training data sets into one comprehensive dataset.

- The script starts by reading each of the files into memory, one by one using the read.table function.
- Next, the data is transformed into a data frame for easier manipulation and flexibility.
- a Run function then is created, for use later, and this function loops through the entire data frame taking the average of each cell, i.e. if a cell has any "space separated" values e.g "21 45", the function replaces that cell with the average of 21 and 45, but if only one value is present, the value is left untouched.
- Finally, the script uses the function to loop through the entore dataset to create the new dataset which has mean values for all elelments present

Variables :
X : actual recorded value 
activity : identifies which activoty was being monitored
subject_data : data identifying subject under study
body_acc_x : body acceleration in x axis
body_acc_y : body acceleration in y axis
body_acc_z : body acceleration in z axis
body_gyro_x : body gyroscope acceleration in x axis
body_gyro_y : body gyroscope acceleration in y axis
body_gyro_z : body gyroscope acceleration in z axis
total_acc_x : total acceleration in x axis
total_acc_y : total acceleration in y axis
total_acc_z : total acceleration in z axis