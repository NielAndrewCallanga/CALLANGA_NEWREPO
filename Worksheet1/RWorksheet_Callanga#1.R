# RCODES FOR WORKSHEET 1-Callanga

#1) R code for setting the value for age
  age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41, 51, 35, 24, 33, 41)
#To get the total data points for age
  age

#2) To get the reciprocal of the values of age
  recip_age <- 1/age
  recip_age

#3) Assigning object new_age with new value
  new_age <- c(age, 0, age)
  new_age

#4) To get the sort value of age
  sort(age)

#5) To get the maximum and minimum value of age
  max(age)
  min(age)

#6) Setting up vector named data
  data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,2.5,2.3, 2.4,2.7)
# To get data total points
  data

#7) To get the doubled value of data
  2* data

#8) R code for generating the following sequence 
  #8.1
    seq(1:100)
  #8.2
    seq(20:60)
  #8.5
    seq(1:1000)

  # r codes for getting the mean and sum
  #8.3
    mean(20:60)
  #8.4
    sum(51:91)

  # a. to get the total data points from 8.1 to 8.4
    sum(100,41,41,41)
  # b.
    seq(1:100)
    seq(20:60)
    mean(20:60)
    sum(51:91)
  # c.to get the maximum points until 10
    seq (1:10)

#9)Print a vector with the integers between 1 and 100 that are not divisible by 3, 5 and 7 using filter option.
  Filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100))

#10) Generating a sequence backwards of the integers from 1 to 100
  seq(from = 100, to = 1)

#11) Listing all the natural numbers below 25 that are multiples of 3 or 5. Find the sum of these multiples.
  (1:25)
#To get the sum of these multiples.
  sum((1:25)[((1:25)%%3 == 0) | ((1:25)%%5 == 0)])

#12)Enter this statement:{ x <- 0+ x + 5 + } and describe the output
  { x <- 0+ x + 5 +  }

#13) Set up a vector named score, consisting of 72, 86, 92, 63, 88, 89, 91, 92, 75,75 and 77.
  score <- c(72, 86, 92, 63, 88, 89, 91, 92, 75,75,77)
  score

#14)	*Create a vector a = c(1,2,NA,4,NA,6,7.
        #a.	Change the NA to 999 using the codes print(a,na.print="-999")

        a <- c(1,2,NA,4,NA,6,7)
        print(a,na.print="-999")


#15)Follow the codes below:

    name = readline(prompt="Input your name: ") 
    age = readline(prompt="Input your age: ")
    print(paste("My name is",name, "and I am",age ,"years old.")) 
    print(R.version.string)






