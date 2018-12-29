---
title: "TIDY DATA SET - Codebook"
author: "Vilem Reznicek"
---

This documents provides detail about the generated tidy dataset by the script 
```sh
run_analysis.R 
```

The script is design to process input data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
according to *following requirements*:

  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement.
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names.
  * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data set can be loaded using following steps:

```r
library(data.table)   #better for large datasets
tidyData <- read.table("tidyData.txt", header = TRUE)
```

According to requirements the data in the final data set **tidyData** is:

  1. Only measures that are **mean values or standard deviation values**, and
  2. **Average** of each of the variables on the data subset for each activity and each subject.

The output data set has **68 columns** and **180 rows**.

OUTPUT DATASET DESCRIPTION
------------

The dataset consists of **2 Dimensions** and **66 Measures** (Variables). 

| Dimension | Description |
|-----------|-------------|
| **ACTIVITY**|The ID of the test subject (String)|
| **SUBJECT**| The type of activity performed when the corresponding measurements were recorded (Integer)|

Full list of all activities in the data set:
----------------------

```
## [1] LAYING             SITTING            STANDING          
## [4] WALKING            WALKING_DOWNSTAIRS WALKING_UPSTAIRS  
## 6 Levels: LAYING SITTING STANDING WALKING ... WALKING_UPSTAIRS
```

List of Measures (Variables):
------------

```
##  [1] "TIME_BODY_ACCEL_MEAN_X"            
##  [2] "TIME_BODY_ACCEL_MEAN_Y"            
##  [3] "TIME_BODY_ACCEL_MEAN_Z"            
##  [4] "TIME_BODY_ACCEL_STDDEV_X"          
##  [5] "TIME_BODY_ACCEL_STDDEV_Y"          
##  [6] "TIME_BODY_ACCEL_STDDEV_Z"          
##  [7] "TIME_GRAV_ACCEL_MEAN_X"            
##  [8] "TIME_GRAV_ACCEL_MEAN_Y"            
##  [9] "TIME_GRAV_ACCEL_MEAN_Z"            
## [10] "TIME_GRAV_ACCEL_STDDEV_X"          
## [11] "TIME_GRAV_ACCEL_STDDEV_Y"          
## [12] "TIME_GRAV_ACCEL_STDDEV_Z"          
## [13] "TIME_BODY_ACCEL_JERK_MEAN_X"       
## [14] "TIME_BODY_ACCEL_JERK_MEAN_Y"       
## [15] "TIME_BODY_ACCEL_JERK_MEAN_Z"       
## [16] "TIME_BODY_ACCEL_JERK_STDDEV_X"     
## [17] "TIME_BODY_ACCEL_JERK_STDDEV_Y"     
## [18] "TIME_BODY_ACCEL_JERK_STDDEV_Z"     
## [19] "TIME_BODY_GYRO_MEAN_X"             
## [20] "TIME_BODY_GYRO_MEAN_Y"             
## [21] "TIME_BODY_GYRO_MEAN_Z"             
## [22] "TIME_BODY_GYRO_STDDEV_X"           
## [23] "TIME_BODY_GYRO_STDDEV_Y"           
## [24] "TIME_BODY_GYRO_STDDEV_Z"           
## [25] "TIME_BODY_GYRO_JERK_MEAN_X"        
## [26] "TIME_BODY_GYRO_JERK_MEAN_Y"        
## [27] "TIME_BODY_GYRO_JERK_MEAN_Z"        
## [28] "TIME_BODY_GYRO_JERK_STDDEV_X"      
## [29] "TIME_BODY_GYRO_JERK_STDDEV_Y"      
## [30] "TIME_BODY_GYRO_JERK_STDDEV_Z"      
## [31] "TIME_BODY_ACCEL_MAGNIT_MEAN"       
## [32] "TIME_BODY_ACCEL_MAGNIT_STDDEV"     
## [33] "TIME_GRAV_ACCEL_MAGNIT_MEAN"       
## [34] "TIME_GRAV_ACCEL_MAGNIT_STDDEV"     
## [35] "TIME_BODY_ACCEL_JERK_MAGNIT_MEAN"  
## [36] "TIME_BODY_ACCEL_JERK_MAGNIT_STDDEV"
## [37] "TIME_BODY_GYRO_MAGNIT_MEAN"        
## [38] "TIME_BODY_GYRO_MAGNIT_STDDEV"      
## [39] "TIME_BODY_GYRO_JERK_MAGNIT_MEAN"   
## [40] "TIME_BODY_GYRO_JERK_MAGNIT_STDDEV" 
## [41] "FREQ_BODY_ACCEL_MEAN_X"            
## [42] "FREQ_BODY_ACCEL_MEAN_Y"            
## [43] "FREQ_BODY_ACCEL_MEAN_Z"            
## [44] "FREQ_BODY_ACCEL_STDDEV_X"          
## [45] "FREQ_BODY_ACCEL_STDDEV_Y"          
## [46] "FREQ_BODY_ACCEL_STDDEV_Z"          
## [47] "FREQ_BODY_ACCEL_JERK_MEAN_X"       
## [48] "FREQ_BODY_ACCEL_JERK_MEAN_Y"       
## [49] "FREQ_BODY_ACCEL_JERK_MEAN_Z"       
## [50] "FREQ_BODY_ACCEL_JERK_STDDEV_X"     
## [51] "FREQ_BODY_ACCEL_JERK_STDDEV_Y"     
## [52] "FREQ_BODY_ACCEL_JERK_STDDEV_Z"     
## [53] "FREQ_BODY_GYRO_MEAN_X"             
## [54] "FREQ_BODY_GYRO_MEAN_Y"             
## [55] "FREQ_BODY_GYRO_MEAN_Z"             
## [56] "FREQ_BODY_GYRO_STDDEV_X"           
## [57] "FREQ_BODY_GYRO_STDDEV_Y"           
## [58] "FREQ_BODY_GYRO_STDDEV_Z"           
## [59] "FREQ_BODY_ACCEL_MAGNIT_MEAN"       
## [60] "FREQ_BODY_ACCEL_MAGNIT_STDDEV"     
## [61] "FREQ_BODY_ACCEL_JERK_MAGNIT_MEAN"  
## [62] "FREQ_BODY_ACCEL_JERK_MAGNIT_STDDEV"
## [63] "FREQ_BODY_GYRO_MAGNIT_MEAN"        
## [64] "FREQ_BODY_GYRO_MAGNIT_STDDEV"
```

Data teaser:
------------------------------


```r
str(tidyData)
```

```
## 'data.frame':	180 obs. of  68 variables:
##  $ ACTIVITY                          : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
##  $ SUBJECT                           : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ TIME_BODY_ACCEL_MEAN_X            : num  0.222 0.261 0.279 0.277 0.289 ...
##  $ TIME_BODY_ACCEL_MEAN_Y            : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
##  $ TIME_BODY_ACCEL_MEAN_Z            : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
##  $ TIME_BODY_ACCEL_STDDEV_X          : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
##  $ TIME_BODY_ACCEL_STDDEV_Y          : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
##  $ TIME_BODY_ACCEL_STDDEV_Z          : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
##  $ TIME_GRAV_ACCEL_MEAN_X            : num  -0.249 0.832 0.943 0.935 0.932 ...
##  $ TIME_GRAV_ACCEL_MEAN_Y            : num  0.706 0.204 -0.273 -0.282 -0.267 ...
##  $ TIME_GRAV_ACCEL_MEAN_Z            : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
##  $ TIME_GRAV_ACCEL_STDDEV_X          : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
##  $ TIME_GRAV_ACCEL_STDDEV_Y          : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
##  $ TIME_GRAV_ACCEL_STDDEV_Z          : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
##  $ TIME_BODY_ACCEL_JERK_MEAN_X       : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
##  $ TIME_BODY_ACCEL_JERK_MEAN_Y       : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
##  $ TIME_BODY_ACCEL_JERK_MEAN_Z       : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
##  $ TIME_BODY_ACCEL_JERK_STDDEV_X     : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
##  $ TIME_BODY_ACCEL_JERK_STDDEV_Y     : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
##  $ TIME_BODY_ACCEL_JERK_STDDEV_Z     : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
##  $ TIME_BODY_GYRO_MEAN_X             : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
##  $ TIME_BODY_GYRO_MEAN_Y             : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
##  $ TIME_BODY_GYRO_MEAN_Z             : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
##  $ TIME_BODY_GYRO_STDDEV_X           : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
##  $ TIME_BODY_GYRO_STDDEV_Y           : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
##  $ TIME_BODY_GYRO_STDDEV_Z           : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
##  $ TIME_BODY_GYRO_JERK_MEAN_X        : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
##  $ TIME_BODY_GYRO_JERK_MEAN_Y        : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
##  $ TIME_BODY_GYRO_JERK_MEAN_Z        : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
##  $ TIME_BODY_GYRO_JERK_STDDEV_X      : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
##  $ TIME_BODY_GYRO_JERK_STDDEV_Y      : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
##  $ TIME_BODY_GYRO_JERK_STDDEV_Z      : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
##  $ TIME_BODY_ACCEL_MAGNIT_MEAN       : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
##  $ TIME_BODY_ACCEL_MAGNIT_STDDEV     : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
##  $ TIME_GRAV_ACCEL_MAGNIT_MEAN       : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
##  $ TIME_GRAV_ACCEL_MAGNIT_STDDEV     : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
##  $ TIME_BODY_ACCEL_JERK_MAGNIT_MEAN  : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
##  $ TIME_BODY_ACCEL_JERK_MAGNIT_STDDEV: num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
##  $ TIME_BODY_GYRO_MAGNIT_MEAN        : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
##  $ TIME_BODY_GYRO_MAGNIT_STDDEV      : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
##  $ TIME_BODY_GYRO_JERK_MAGNIT_MEAN   : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
##  $ TIME_BODY_GYRO_JERK_MAGNIT_STDDEV : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
##  $ FREQ_BODY_ACCEL_MEAN_X            : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
##  $ FREQ_BODY_ACCEL_MEAN_Y            : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
##  $ FREQ_BODY_ACCEL_MEAN_Z            : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
##  $ FREQ_BODY_ACCEL_STDDEV_X          : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
##  $ FREQ_BODY_ACCEL_STDDEV_Y          : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
##  $ FREQ_BODY_ACCEL_STDDEV_Z          : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
##  $ FREQ_BODY_ACCEL_JERK_MEAN_X       : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
##  $ FREQ_BODY_ACCEL_JERK_MEAN_Y       : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
##  $ FREQ_BODY_ACCEL_JERK_MEAN_Z       : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
##  $ FREQ_BODY_ACCEL_JERK_STDDEV_X     : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
##  $ FREQ_BODY_ACCEL_JERK_STDDEV_Y     : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
##  $ FREQ_BODY_ACCEL_JERK_STDDEV_Z     : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
##  $ FREQ_BODY_GYRO_MEAN_X             : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
##  $ FREQ_BODY_GYRO_MEAN_Y             : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
##  $ FREQ_BODY_GYRO_MEAN_Z             : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
##  $ FREQ_BODY_GYRO_STDDEV_X           : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
##  $ FREQ_BODY_GYRO_STDDEV_Y           : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
##  $ FREQ_BODY_GYRO_STDDEV_Z           : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
##  $ FREQ_BODY_ACCEL_MAGNIT_MEAN       : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
##  $ FREQ_BODY_ACCEL_MAGNIT_STDDEV     : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
##  $ FREQ_BODY_ACCEL_JERK_MAGNIT_MEAN  : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
##  $ FREQ_BODY_ACCEL_JERK_MAGNIT_STDDEV: num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
##  $ FREQ_BODY_GYRO_MAGNIT_MEAN        : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
##  $ FREQ_BODY_GYRO_MAGNIT_STDDEV      : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
##  $ FREQ_BODY_GYRO_JERK_MAGNIT_MEAN   : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
##  $ FREQ_BODY_GYRO_JERK_MAGNIT_STDDEV : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...
```

Data Summary:
--------------------


```r
summary(tidyData)
```

```
##                ACTIVITY     SUBJECT     TIME_BODY_ACCEL_MEAN_X
##  LAYING            :30   Min.   : 1.0   Min.   :0.2216        
##  SITTING           :30   1st Qu.: 8.0   1st Qu.:0.2712        
##  STANDING          :30   Median :15.5   Median :0.2770        
##  WALKING           :30   Mean   :15.5   Mean   :0.2743        
##  WALKING_DOWNSTAIRS:30   3rd Qu.:23.0   3rd Qu.:0.2800        
##  WALKING_UPSTAIRS  :30   Max.   :30.0   Max.   :0.3015        
##  TIME_BODY_ACCEL_MEAN_Y TIME_BODY_ACCEL_MEAN_Z TIME_BODY_ACCEL_STDDEV_X
##  Min.   :-0.040514      Min.   :-0.15251       Min.   :-0.9961         
##  1st Qu.:-0.020022      1st Qu.:-0.11207       1st Qu.:-0.9799         
##  Median :-0.017262      Median :-0.10819       Median :-0.7526         
##  Mean   :-0.017876      Mean   :-0.10916       Mean   :-0.5577         
##  3rd Qu.:-0.014936      3rd Qu.:-0.10443       3rd Qu.:-0.1984         
##  Max.   :-0.001308      Max.   :-0.07538       Max.   : 0.6269         
##  TIME_BODY_ACCEL_STDDEV_Y TIME_BODY_ACCEL_STDDEV_Z TIME_GRAV_ACCEL_MEAN_X
##  Min.   :-0.99024         Min.   :-0.9877          Min.   :-0.6800       
##  1st Qu.:-0.94205         1st Qu.:-0.9498          1st Qu.: 0.8376       
##  Median :-0.50897         Median :-0.6518          Median : 0.9208       
##  Mean   :-0.46046         Mean   :-0.5756          Mean   : 0.6975       
##  3rd Qu.:-0.03077         3rd Qu.:-0.2306          3rd Qu.: 0.9425       
##  Max.   : 0.61694         Max.   : 0.6090          Max.   : 0.9745       
##  TIME_GRAV_ACCEL_MEAN_Y TIME_GRAV_ACCEL_MEAN_Z TIME_GRAV_ACCEL_STDDEV_X
##  Min.   :-0.47989       Min.   :-0.49509       Min.   :-0.9968         
##  1st Qu.:-0.23319       1st Qu.:-0.11726       1st Qu.:-0.9825         
##  Median :-0.12782       Median : 0.02384       Median :-0.9695         
##  Mean   :-0.01621       Mean   : 0.07413       Mean   :-0.9638         
##  3rd Qu.: 0.08773       3rd Qu.: 0.14946       3rd Qu.:-0.9509         
##  Max.   : 0.95659       Max.   : 0.95787       Max.   :-0.8296         
##  TIME_GRAV_ACCEL_STDDEV_Y TIME_GRAV_ACCEL_STDDEV_Z
##  Min.   :-0.9942          Min.   :-0.9910         
##  1st Qu.:-0.9711          1st Qu.:-0.9605         
##  Median :-0.9590          Median :-0.9450         
##  Mean   :-0.9524          Mean   :-0.9364         
##  3rd Qu.:-0.9370          3rd Qu.:-0.9180         
##  Max.   :-0.6436          Max.   :-0.6102         
##  TIME_BODY_ACCEL_JERK_MEAN_X TIME_BODY_ACCEL_JERK_MEAN_Y
##  Min.   :0.04269             Min.   :-0.0386872         
##  1st Qu.:0.07396             1st Qu.: 0.0004664         
##  Median :0.07640             Median : 0.0094698         
##  Mean   :0.07947             Mean   : 0.0075652         
##  3rd Qu.:0.08330             3rd Qu.: 0.0134008         
##  Max.   :0.13019             Max.   : 0.0568186         
##  TIME_BODY_ACCEL_JERK_MEAN_Z TIME_BODY_ACCEL_JERK_STDDEV_X
##  Min.   :-0.067458           Min.   :-0.9946              
##  1st Qu.:-0.010601           1st Qu.:-0.9832              
##  Median :-0.003861           Median :-0.8104              
##  Mean   :-0.004953           Mean   :-0.5949              
##  3rd Qu.: 0.001958           3rd Qu.:-0.2233              
##  Max.   : 0.038053           Max.   : 0.5443              
##  TIME_BODY_ACCEL_JERK_STDDEV_Y TIME_BODY_ACCEL_JERK_STDDEV_Z
##  Min.   :-0.9895               Min.   :-0.99329             
##  1st Qu.:-0.9724               1st Qu.:-0.98266             
##  Median :-0.7756               Median :-0.88366             
##  Mean   :-0.5654               Mean   :-0.73596             
##  3rd Qu.:-0.1483               3rd Qu.:-0.51212             
##  Max.   : 0.3553               Max.   : 0.03102             
##  TIME_BODY_GYRO_MEAN_X TIME_BODY_GYRO_MEAN_Y TIME_BODY_GYRO_MEAN_Z
##  Min.   :-0.20578      Min.   :-0.20421      Min.   :-0.07245     
##  1st Qu.:-0.04712      1st Qu.:-0.08955      1st Qu.: 0.07475     
##  Median :-0.02871      Median :-0.07318      Median : 0.08512     
##  Mean   :-0.03244      Mean   :-0.07426      Mean   : 0.08744     
##  3rd Qu.:-0.01676      3rd Qu.:-0.06113      3rd Qu.: 0.10177     
##  Max.   : 0.19270      Max.   : 0.02747      Max.   : 0.17910     
##  TIME_BODY_GYRO_STDDEV_X TIME_BODY_GYRO_STDDEV_Y TIME_BODY_GYRO_STDDEV_Z
##  Min.   :-0.9943         Min.   :-0.9942         Min.   :-0.9855        
##  1st Qu.:-0.9735         1st Qu.:-0.9629         1st Qu.:-0.9609        
##  Median :-0.7890         Median :-0.8017         Median :-0.8010        
##  Mean   :-0.6916         Mean   :-0.6533         Mean   :-0.6164        
##  3rd Qu.:-0.4414         3rd Qu.:-0.4196         3rd Qu.:-0.3106        
##  Max.   : 0.2677         Max.   : 0.4765         Max.   : 0.5649        
##  TIME_BODY_GYRO_JERK_MEAN_X TIME_BODY_GYRO_JERK_MEAN_Y
##  Min.   :-0.15721           Min.   :-0.07681          
##  1st Qu.:-0.10322           1st Qu.:-0.04552          
##  Median :-0.09868           Median :-0.04112          
##  Mean   :-0.09606           Mean   :-0.04269          
##  3rd Qu.:-0.09110           3rd Qu.:-0.03842          
##  Max.   :-0.02209           Max.   :-0.01320          
##  TIME_BODY_GYRO_JERK_MEAN_Z TIME_BODY_GYRO_JERK_STDDEV_X
##  Min.   :-0.092500          Min.   :-0.9965             
##  1st Qu.:-0.061725          1st Qu.:-0.9800             
##  Median :-0.053430          Median :-0.8396             
##  Mean   :-0.054802          Mean   :-0.7036             
##  3rd Qu.:-0.048985          3rd Qu.:-0.4629             
##  Max.   :-0.006941          Max.   : 0.1791             
##  TIME_BODY_GYRO_JERK_STDDEV_Y TIME_BODY_GYRO_JERK_STDDEV_Z
##  Min.   :-0.9971              Min.   :-0.9954             
##  1st Qu.:-0.9832              1st Qu.:-0.9848             
##  Median :-0.8942              Median :-0.8610             
##  Mean   :-0.7636              Mean   :-0.7096             
##  3rd Qu.:-0.5861              3rd Qu.:-0.4741             
##  Max.   : 0.2959              Max.   : 0.1932             
##  TIME_BODY_ACCEL_MAGNIT_MEAN TIME_BODY_ACCEL_MAGNIT_STDDEV
##  Min.   :-0.9865             Min.   :-0.9865              
##  1st Qu.:-0.9573             1st Qu.:-0.9430              
##  Median :-0.4829             Median :-0.6074              
##  Mean   :-0.4973             Mean   :-0.5439              
##  3rd Qu.:-0.0919             3rd Qu.:-0.2090              
##  Max.   : 0.6446             Max.   : 0.4284              
##  TIME_GRAV_ACCEL_MAGNIT_MEAN TIME_GRAV_ACCEL_MAGNIT_STDDEV
##  Min.   :-0.9865             Min.   :-0.9865              
##  1st Qu.:-0.9573             1st Qu.:-0.9430              
##  Median :-0.4829             Median :-0.6074              
##  Mean   :-0.4973             Mean   :-0.5439              
##  3rd Qu.:-0.0919             3rd Qu.:-0.2090              
##  Max.   : 0.6446             Max.   : 0.4284              
##  TIME_BODY_ACCEL_JERK_MAGNIT_MEAN TIME_BODY_ACCEL_JERK_MAGNIT_STDDEV
##  Min.   :-0.9928                  Min.   :-0.9946                   
##  1st Qu.:-0.9807                  1st Qu.:-0.9765                   
##  Median :-0.8168                  Median :-0.8014                   
##  Mean   :-0.6079                  Mean   :-0.5842                   
##  3rd Qu.:-0.2456                  3rd Qu.:-0.2173                   
##  Max.   : 0.4345                  Max.   : 0.4506                   
##  TIME_BODY_GYRO_MAGNIT_MEAN TIME_BODY_GYRO_MAGNIT_STDDEV
##  Min.   :-0.9807            Min.   :-0.9814             
##  1st Qu.:-0.9461            1st Qu.:-0.9476             
##  Median :-0.6551            Median :-0.7420             
##  Mean   :-0.5652            Mean   :-0.6304             
##  3rd Qu.:-0.2159            3rd Qu.:-0.3602             
##  Max.   : 0.4180            Max.   : 0.3000             
##  TIME_BODY_GYRO_JERK_MAGNIT_MEAN TIME_BODY_GYRO_JERK_MAGNIT_STDDEV
##  Min.   :-0.99732                Min.   :-0.9977                  
##  1st Qu.:-0.98515                1st Qu.:-0.9805                  
##  Median :-0.86479                Median :-0.8809                  
##  Mean   :-0.73637                Mean   :-0.7550                  
##  3rd Qu.:-0.51186                3rd Qu.:-0.5767                  
##  Max.   : 0.08758                Max.   : 0.2502                  
##  FREQ_BODY_ACCEL_MEAN_X FREQ_BODY_ACCEL_MEAN_Y FREQ_BODY_ACCEL_MEAN_Z
##  Min.   :-0.9952        Min.   :-0.98903       Min.   :-0.9895       
##  1st Qu.:-0.9787        1st Qu.:-0.95361       1st Qu.:-0.9619       
##  Median :-0.7691        Median :-0.59498       Median :-0.7236       
##  Mean   :-0.5758        Mean   :-0.48873       Mean   :-0.6297       
##  3rd Qu.:-0.2174        3rd Qu.:-0.06341       3rd Qu.:-0.3183       
##  Max.   : 0.5370        Max.   : 0.52419       Max.   : 0.2807       
##  FREQ_BODY_ACCEL_STDDEV_X FREQ_BODY_ACCEL_STDDEV_Y
##  Min.   :-0.9966          Min.   :-0.99068        
##  1st Qu.:-0.9820          1st Qu.:-0.94042        
##  Median :-0.7470          Median :-0.51338        
##  Mean   :-0.5522          Mean   :-0.48148        
##  3rd Qu.:-0.1966          3rd Qu.:-0.07913        
##  Max.   : 0.6585          Max.   : 0.56019        
##  FREQ_BODY_ACCEL_STDDEV_Z FREQ_BODY_ACCEL_JERK_MEAN_X
##  Min.   :-0.9872          Min.   :-0.9946            
##  1st Qu.:-0.9459          1st Qu.:-0.9828            
##  Median :-0.6441          Median :-0.8126            
##  Mean   :-0.5824          Mean   :-0.6139            
##  3rd Qu.:-0.2655          3rd Qu.:-0.2820            
##  Max.   : 0.6871          Max.   : 0.4743            
##  FREQ_BODY_ACCEL_JERK_MEAN_Y FREQ_BODY_ACCEL_JERK_MEAN_Z
##  Min.   :-0.9894             Min.   :-0.9920            
##  1st Qu.:-0.9725             1st Qu.:-0.9796            
##  Median :-0.7817             Median :-0.8707            
##  Mean   :-0.5882             Mean   :-0.7144            
##  3rd Qu.:-0.1963             3rd Qu.:-0.4697            
##  Max.   : 0.2767             Max.   : 0.1578            
##  FREQ_BODY_ACCEL_JERK_STDDEV_X FREQ_BODY_ACCEL_JERK_STDDEV_Y
##  Min.   :-0.9951               Min.   :-0.9905              
##  1st Qu.:-0.9847               1st Qu.:-0.9737              
##  Median :-0.8254               Median :-0.7852              
##  Mean   :-0.6121               Mean   :-0.5707              
##  3rd Qu.:-0.2475               3rd Qu.:-0.1685              
##  Max.   : 0.4768               Max.   : 0.3498              
##  FREQ_BODY_ACCEL_JERK_STDDEV_Z FREQ_BODY_GYRO_MEAN_X FREQ_BODY_GYRO_MEAN_Y
##  Min.   :-0.993108             Min.   :-0.9931       Min.   :-0.9940      
##  1st Qu.:-0.983747             1st Qu.:-0.9697       1st Qu.:-0.9700      
##  Median :-0.895121             Median :-0.7300       Median :-0.8141      
##  Mean   :-0.756489             Mean   :-0.6367       Mean   :-0.6767      
##  3rd Qu.:-0.543787             3rd Qu.:-0.3387       3rd Qu.:-0.4458      
##  Max.   :-0.006236             Max.   : 0.4750       Max.   : 0.3288      
##  FREQ_BODY_GYRO_MEAN_Z FREQ_BODY_GYRO_STDDEV_X FREQ_BODY_GYRO_STDDEV_Y
##  Min.   :-0.9860       Min.   :-0.9947         Min.   :-0.9944        
##  1st Qu.:-0.9624       1st Qu.:-0.9750         1st Qu.:-0.9602        
##  Median :-0.7909       Median :-0.8086         Median :-0.7964        
##  Mean   :-0.6044       Mean   :-0.7110         Mean   :-0.6454        
##  3rd Qu.:-0.2635       3rd Qu.:-0.4813         3rd Qu.:-0.4154        
##  Max.   : 0.4924       Max.   : 0.1966         Max.   : 0.6462        
##  FREQ_BODY_GYRO_STDDEV_Z FREQ_BODY_ACCEL_MAGNIT_MEAN
##  Min.   :-0.9867         Min.   :-0.9868            
##  1st Qu.:-0.9643         1st Qu.:-0.9560            
##  Median :-0.8224         Median :-0.6703            
##  Mean   :-0.6577         Mean   :-0.5365            
##  3rd Qu.:-0.3916         3rd Qu.:-0.1622            
##  Max.   : 0.5225         Max.   : 0.5866            
##  FREQ_BODY_ACCEL_MAGNIT_STDDEV FREQ_BODY_ACCEL_JERK_MAGNIT_MEAN
##  Min.   :-0.9876               Min.   :-0.9940                 
##  1st Qu.:-0.9452               1st Qu.:-0.9770                 
##  Median :-0.6513               Median :-0.7940                 
##  Mean   :-0.6210               Mean   :-0.5756                 
##  3rd Qu.:-0.3654               3rd Qu.:-0.1872                 
##  Max.   : 0.1787               Max.   : 0.5384                 
##  FREQ_BODY_ACCEL_JERK_MAGNIT_STDDEV FREQ_BODY_GYRO_MAGNIT_MEAN
##  Min.   :-0.9944                    Min.   :-0.9865           
##  1st Qu.:-0.9752                    1st Qu.:-0.9616           
##  Median :-0.8126                    Median :-0.7657           
##  Mean   :-0.5992                    Mean   :-0.6671           
##  3rd Qu.:-0.2668                    3rd Qu.:-0.4087           
##  Max.   : 0.3163                    Max.   : 0.2040           
##  FREQ_BODY_GYRO_MAGNIT_STDDEV FREQ_BODY_GYRO_JERK_MAGNIT_MEAN
##  Min.   :-0.9815              Min.   :-0.9976                
##  1st Qu.:-0.9488              1st Qu.:-0.9813                
##  Median :-0.7727              Median :-0.8779                
##  Mean   :-0.6723              Mean   :-0.7564                
##  3rd Qu.:-0.4277              3rd Qu.:-0.5831                
##  Max.   : 0.2367              Max.   : 0.1466                
##  FREQ_BODY_GYRO_JERK_MAGNIT_STDDEV
##  Min.   :-0.9976                  
##  1st Qu.:-0.9802                  
##  Median :-0.8941                  
##  Mean   :-0.7715                  
##  3rd Qu.:-0.6081                  
##  Max.   : 0.2878
```

File Name and Format:
------------

The contents of the dataset is stored in a **tab-delimited text file with a column header** (line #1), the output filename is :  `tidyData.txt`.



