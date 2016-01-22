### Exercise 3 ###

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100)
employees <- paste('Employee', 1:100)

# Create a vector of 2014 salaries using the runif function
salaries_2014 <- runif(100, 40000, 50000)

# Create a vector of 2015 salaries that are typically higher than the 2014 salaires, but not always
salaries_2015 <- salaries_2014 + runif(100, -5000, 10000)

# Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(employees, salaries_2014, salaries_2015)

# In "salaries", change the name of Employee 1 to your name. Did you get an error?
salaries$employees[1] <- 'Mike'


# Create a column 'got_raise' that is TRUE if the person got a raise
salaries$got_raise <- (salaries_2015 - salaries_2014) > 0

# How many employees got a raise?
length(salaries$got_raise[salaries$got_raise == TRUE])

# What was the average salary increase?
avg_increase <- mean(salaries$salaries_2015 - salaries_2014)

# Write a .csv file of your salaries to your working directory
write.csv(salaries, 'salaries.csv')

### Bonus ###

# For people who did not get a raise, how much money did they lose?
salaries$diff <- salaries$salaries_2015 - salaries_2014
avg_loss <- mean(salaries$diff[salaries$got_raise == FALSE])
# Is that what you expected them to lose?

### Double Bonus ###

# Repeat the above experiment 100 times, tracking the loss each time.
# Does the average loss equal what you expect?
# What about 10,000 times?
