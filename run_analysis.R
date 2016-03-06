library(dplyr)



X_test_data <- read.table("test/X_test.txt", sep = "\t", header = FALSE)
Y_test_data <- read.table("test/Y_test.txt", sep = "\t", header = FALSE)
subject_test_data <- read.table("test/subject_test.txt", sep = "\t", header = FALSE)

X_train_data <- read.table("train/X_train.txt", sep = "\t", header = FALSE)
Y_train_data <- read.table("train/y_train.txt", sep = "\t", header = FALSE)
subject_train_data <- read.table("train/subject_train.txt", sep = "\t", header = FALSE)

#test Inertial Signals
body_acc_x_test <- read.table("test/Inertial Signals/body_acc_x_test.txt", sep = "\t", header = FALSE)
body_acc_y_test <- read.table("test/Inertial Signals/body_acc_y_test.txt", sep = "\t", header = FALSE)
body_acc_z_test <- read.table("test/Inertial Signals/body_acc_z_test.txt", sep = "\t", header = FALSE)

body_gyro_x_test <- read.table("test/Inertial Signals/body_gyro_x_test.txt", sep = "\t", header = FALSE)
body_gyro_y_test <- read.table("test/Inertial Signals/body_gyro_y_test.txt", sep = "\t", header = FALSE)
body_gyro_z_test <- read.table("test/Inertial Signals/body_gyro_z_test.txt", sep = "\t", header = FALSE)

total_acc_x_test <- read.table("test/Inertial Signals/total_acc_x_test.txt", sep = "\t", header = FALSE)
total_acc_y_test <- read.table("test/Inertial Signals/total_acc_y_test.txt", sep = "\t", header = FALSE)
total_acc_z_test <- read.table("test/Inertial Signals/total_acc_z_test.txt", sep = "\t", header = FALSE)



#train Inertial Signals
body_acc_x_train <- read.table("train/Inertial Signals/body_acc_x_train.txt", sep = "\t", header = FALSE)
body_acc_y_train <- read.table("train/Inertial Signals/body_acc_y_train.txt", sep = "\t", header = FALSE)
body_acc_z_train <- read.table("train/Inertial Signals/body_acc_z_train.txt", sep = "\t", header = FALSE)

body_gyro_x_train <- read.table("train/Inertial Signals/body_gyro_x_train.txt", sep = "\t", header = FALSE)
body_gyro_y_train <- read.table("train/Inertial Signals/body_gyro_y_train.txt", sep = "\t", header = FALSE)
body_gyro_z_train <- read.table("train/Inertial Signals/body_gyro_z_train.txt", sep = "\t", header = FALSE)

total_acc_x_train <- read.table("train/Inertial Signals/total_acc_x_train.txt", sep = "\t", header = FALSE)
total_acc_y_train <- read.table("train/Inertial Signals/total_acc_y_train.txt", sep = "\t", header = FALSE)
total_acc_z_train <- read.table("train/Inertial Signals/total_acc_z_train.txt", sep = "\t", header = FALSE)


all_data <- data.frame(rbind(X_test_data,X_train_data) , rbind(Y_test_data, Y_train_data) , rbind(subject_test_data,subject_train_data) , rbind(body_acc_x_test,body_acc_x_train),rbind(body_acc_y_test,body_acc_y_train), rbind(body_acc_z_test,body_acc_z_train), rbind(body_gyro_x_test,body_gyro_x_train), rbind(body_gyro_y_test,body_gyro_y_train), rbind(body_gyro_z_test,body_gyro_z_train), rbind(total_acc_x_test,total_acc_x_train), rbind(total_acc_y_test,total_acc_y_train), rbind(total_acc_z_test,total_acc_z_train))
#names(all_data) <- c("X","Y","subject_data","body_acc_x", "body_acc_y","body_acc_z","body_gyro_x","body_gyro_y","body_gyro_z", "total_acc_x","total_acc_y","total_acc_z")
all_data <- tbl_df(all_data)

#mean for X readings
averages <- NULL



run <- function(x){
        temp <- data.frame()
        lapply(x, function(y){
                vars <- strsplit(as.character(y), " ")
                vars <- sapply(vars, as.numeric, simplify = TRUE)
                #print(vars)
                mean(as.numeric(vars),na.rm = TRUE)
        })
}

for (i in c(1:10299) ) {
        averages <- rbind(averages, run(all_data[i,]))
}

names(averages) <- c("X","activity","subject_data","body_acc_x", "body_acc_y","body_acc_z","body_gyro_x","body_gyro_y","body_gyro_z", "total_acc_x","total_acc_y","total_acc_z")
final_data <- as.data.frame(averages)



