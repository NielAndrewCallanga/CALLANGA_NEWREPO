library(dplyr)
library(ggplot2)

  mpg_data <- glimpse(mpg)
  mpg_data 
  
#1. How many columns are in mpg dataset? How about the number of rows? Show the
#codes and its result.
  
  
  mpg_data <- glimpse(mpg)
  nrow(mpg)
  
  ncol(mpg)
  

#2. Which manufacturer has the most models in this data set? Which model has 
#the most variations? Ans:
  man_count <- mpg_data %>% group_by(manufacturer) %>%
  count()
  man_count

  
  colnames(man_count) <- c("Manufacturer","Counts")
  
  #a. Group the manufacturers and find the unique models. Copy the codes and 
  #result.
  
  grp_unique <- mpg_data %>% group_by(manufacturer, model) %>%
    distinct() %>% count()
  grp_unique
  
  colnames(grp_unique) <- c("Manufacturer", "Model","Counts")


  #b. Graph the result by using plot() and ggplot(). Write the codes and its 
  #result.

  qplot(model, data = mpg,geom = "bar", fill=manufacturer)
  
  ggplot(mpg, aes(model, manufacturer)) + geom_point()
  
#3. Same dataset will be used. You are going to show the relationship of the 
  #model and the manufacturer.

  mpg_data <- mpg
  modfact <- mpg_data %>% group_by(manufacturer, model) %>%
    distinct() %>% count()
  modfact
  
  colnames(modfact) <- c("Manufacturer", "Model")
  modfact
  
  #a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?
  
  ggplot(mpg, aes(model, manufacturer)) + geom_point()
  #geometric point graph of mpg(model and manufacturer)
  
  #b. For you, is it useful? If not, how could you modify the data to make it 
  #more informative?

  ggplot(mpg, aes(model, manufacturer)) + 
    geom_point() +
    geom_jitter()
  
#4. Using the pipe (%>%), group the model and get the number of cars per model. 
#Show codes and its result.
  
  mpg_data1 <- mpg_data %>% group_by(model) %>% count()
  mpg_data1
  
  colnames(mpg_data1) <- c("Model","Counts")
  mpg_data1
  #a. Plot using the geom_bar() + coord_flip() just like what is shown below. 
  #Show codes and its result.
  
  qplot(model,data = mpg,main = "Number of Cars per Model", xlab = "Model",
        ylab = "Number of Cars", geom = "bar", fill = manufacturer) +
        coord_flip()
  
  
  #b. Use only the top 20 observations. Show code and results.
  
  mpg_data2 <- mpg %>% group_by(model)%>%
    tally(sort = TRUE)
  mpg_data2
  
  ggplot(mpg_data2, aes(x = model, y = n, fill = "rainbow"))+
    geom_bar(stat = "identity") + coord_flip()

  #5. Plot the relationship between cyl - number of cylinders and displ - 
#engine displacement using geom_point with aesthetic colour = engine 
#displacement. Title should be
#“Relationship between No. of Cylinders and Engine Displacement”.
 
  #a. Show the codes and its result.
  
  ggplot(data = mpg , mapping = aes(x = displ, y = cyl, main = "Relationship 
                                    between No of Cylinders and 
                                    Engine Displacement")) + 
  geom_point(mapping=aes(colour = "engine displacement")) 
  
  #b. How would you describe its relationship?

  #Answer: The graph is jittered based on my data, which makes cyl the y. 
  #Its straight horizontal position and pink color, which indicate engine 
  #displacement.
  
#6. Get the total number of observations for drv - type of drive train 
#(f = front-wheel drive,
#r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 
#2seater, etc.).

#Plot using the geom_tile() where the number of observations for class be 
#used as a fill for aesthetics.
  
  #a. Show the codes and its result for the narrative in #6.
  
  ggplot(data = mpg, mapping = aes(x = drv, y = class)) +
    geom_tile(aes(fill=class))
  
  #b. Interpret the result.
  
  #Answer: Using the mapping geometric point graph, areas that are black are 
  #"mapped," where X is a drv and y is a class.

#7. Discuss the difference between these codes. Its outputs for each are shown 
#   below.
  
  #• Code #1
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))
  

  #+ Code #2
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")
  
#8. Try to run the command ?mpg. What is the result of this command?
  
  #a. Which variables from mpg dataset are categorical?
  
  #Answer: Categorical variables in mpg include: manufacturer, model, trans 
  #(type of transmission), drv (front-wheel drive, rear-wheel, 4wd), fl 
  #(fuel type), and class (type of car).
  
  
  #b. Which are continuous variables?
  
  #Answer: Continuous varibles in R are called doubles or integers.
  
  #c. Plot the relationship between displ (engine displacement) and hwy(highway 
  #miles per gallon). Mapped it with a continuous variable you have identified 
  #in #5-b. What is its result? Why it produced such output?
  
  ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) + geom_point()

  #Answer: data tracks the cty by placing cty(city miles per gallon) at color 
  #having a variation or hues of blue.
  
#9. Plot the relationship between displ (engine displacement) and hwy(highway
#miles per gallon) using geom_point(). Add a trend line over the existing plot 
#using geom_smooth() with se = FALSE. Default method is “loess”.
  
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point(mapping=aes(color=class)) +
    geom_smooth(se = FALSE)
  
#10. Using the relationship of displ and hwy, add a trend line over existing 
#plot. Set these = FALSE to remove the confidence interval and method = lm to 
#check for linear modeling.
  
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
    geom_point() +
    geom_smooth(se = FALSE, method = lm)