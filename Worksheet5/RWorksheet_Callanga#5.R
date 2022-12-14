#a. Plot the data using a bar graph. Write the codes and copy the result.

date1 <- c("1st", "2nd", "3rd", "4th")
date2 <- c(80,75,70,60)

graph<- barplot(date2, names.arg = date1, col = "red")


#b. Using the same table, label the barchart with
#Title = ” Enrollment of BS Computer Science
#horizontal axis = “Curriculum Year” and
#vertical axis = “number of students”

graph<- barplot(date2, names.arg = date1, 
                main = "Enrollment of BS Computer Science", 
                ylab = "Number of Students", xlab = "Curriculum Year", 
                col = "red")


#2. The monthly income of De Jesus family was spent on the following:
#60% on Food, 10% on electricity, 5% for savings, and
#25% for other miscellaneous expenses.

#a. Create a table for the above scenario.
#Write the codes and its result.

month_data <- data.frame(
  data = c("Food", "Electricity", "Savings", "Miscellaneous_expenses"),
  spent = c(60, 10, 5, 25)
)
month_data
table_data <- table(month_data)
table_data



#b. Plot the data using a pie chart. Add labels, colors and legend.
#Write the codes and its result.
pdata <- c( 60, 10, 5, 25)
2
data <- round(pdata/sum(pdata)*100,1)
data <- paste(data, "%", sep = " ")

piechart <- pie( pdata, labels = data, cex = 0.5, col = rainbow(4), main = 
                   "De Jesus family Monthly Expenses")
legend("topright", c("Food", "Electricity", "Savings", "Miscellaneous"),
       cex = 0.5 , fill =rainbow(4))


#3. Open the mtcars dataset.
mtdata <- (mtcars$mpg)
mtdata


#a. Create a simple histogram specifically for mpg (miles per gallon) variable.
#Use $ to select the mpg only. Write the codes and its result.
hist(mtcars$mpg)



#b. Colored histogram with different number of bins.
hist(mtcars$mpg, breaks=12, col="red")


#c. Add a Normal Curve

hwnc <-hist(mtdata, breaks=12, col="red", xlab="Miles Per Gallon",
            main="Histogram with Normal Curve")
xfit<-seq(min(mtdata),max(mtdata),length=40)
yfit<-dnorm(xfit,mean=mean(mtdata),sd=sd(mtdata))
yfit <- yfit*diff(hwnc$mids[1:2])*length(mtdata)
lines(xfit, yfit, col="blue", lwd=2)


#4. Open the iris dataset. Create a subset for each species.

#a. Write the codes and its result.
dtf <- data.frame(iris)
dtf

setosa <- subset(iris, Species == "setosa")
setosa

versicolor <- subset(iris, Species == "versicolor")
versicolor

virginica <- subset(iris, Species == "virginica")
virginica
#b. Get the mean for every characteristics of each species using colMeans().
#Write the codes and its result.

setosa <- subset(iris, Species == "setosa")
setosa <- colMeans(setosa[sapply(setosa,is.numeric)])
setosa

versicolor <- subset(iris, Species == "versicolor")
versicolor <- colMeans(versicolor[sapply(versicolor,is.numeric)])
versicolor

virginica <- subset(iris, Species == "virginica")
virginica <- colMeans(virginica[sapply(virginica,is.numeric)])
virginica


#c. Combine all species by using rbind()

rbtable <- rbind(setosa, versicolor, virginica)
rbtable


#d. From the data in 4-c: Create the barplot().
#Write the codes and its result.

barplot(height = as.matrix(rbtable),main = "Iris Data",
        ylab = "Mean Scores",
        beside =T, col = rainbow(3)
)
