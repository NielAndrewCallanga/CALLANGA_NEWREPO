#1. The table below shows the data about shoe size and height. Create a data 
#frame.

  #a. Describe the data.

  Shoe_size <- c(6.5, 9.0, 8.5, 8.5, 10.5, 7.0, 9.5, 9.0, 13.0,
              7.5, 10.5, 8.5, 12.0, 10.5, 13.0, 11.5, 8.5, 5.0, 
              10.0, 6.5, 7.5, 8.5, 10.5, 8.5, 10.5, 11.0, 9.0, 
              13.0)

  Height <- c(66.0, 68.0, 64.5, 65.0, 70.0, 64.0, 70.0, 71.0, 
              72.0, 64.0, 74.5, 67.0, 71.0, 71.0, 77.0, 72.0,
              59.0, 62.0, 72.0, 66.0, 64.0, 67.0, 73.0, 69.0, 
              72.0, 70.0, 69.0, 70)

  Gender <- c("F", "F", "F", "F", "M", "F", "M", "F", "M", "M", 
              "M", "F", "M", "M", "M", "M", "F", "F", "M", "F", 
              "M", "M", "M", "F", "M", "M", "M", "M")

  data <- data.frame(Shoe_size,Height,Gender)
  data
  
  #b. Find the mean of shoe size and height of the respondents.
  #Copy the codes and results.
  
  summary(data)

  # Mean of Shoe size  : 9.411
  # Mean of Height  :68.57 

  #c. Is there a relationship between shoe size and height? Why?

  # Yes, The Higher the height, the bigger the shoe size.

#2. Construct character vector months to a factor with factor() and assign 
    #the result to factor_months_vector. Print out factor_months_vector and 
    #assert that R prints out the factor levels below the actual values
  
    Months <- c("March","April","January","November","January",
               "September","October","September","November","August",
              "January","November","November","February","May","August",
              "July","December","August","August","September","November",
              "February","April")

  factor_Months <- factor(Months)
  factor_Months


#3. Then check the summary() of the months_vector and factor_months_vector. 
  #Interpret the results of both vectors. Are they both equally useful in this 
  #case?
  
  #Answer: #Yes, they are useful because they count the number of repeated data 
            #points in your variable without requiring you to do so manually.
  
  summary(Months)

  summary(factor_Months)

#4. Create a vector and factor for the table below.
 
  
  factor_data <- c( East = '1', West = '4',North = '3')
  factor_data

  new_order_data <- factor(factor_data,levels = c("East" = '1',"West" = '4', 
                                                  "North" = '3'))

  new_order_data

#5. Enter the data below in Excel with file name = import_march.csv

  #a. Import the excel file into the Environment Pane using read.table() 
   #function.
  
  getwd()
 
  
  import <- read.table("import_march.csv", header = TRUE, sep = ",")
  import
  
  #b. View the data set. Write the code and its result.

  import <- read.table("import_march.csv", header = TRUE, sep = ",")
  import
  
  #Students Strategy1 Strategy2 Strategy3
  #1     Male         8        10         8
  #2                  4         8         6
  #3                  0         6         4
  #4   Female        14         4        15
  #5                 10         2        12
  #6                  6         0         9

