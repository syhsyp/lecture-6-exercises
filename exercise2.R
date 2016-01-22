### Exercise 2 ###

# Load R's "USPersonalExpenditure" dataest using the "data()" function
data("USPersonalExpenditure")

# The variable USPersonalExpenditure is now accessible to you.  Unfortunately, it's not a data.frame
# Test this using the is.data.frame function
is.data.frame(USPersonalExpenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable to the data.frame function
# to convert it a data.farme

# Create a new variable by passing the USPersonalExpenditure to the data.frame function
us_exp <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
colnames(us_exp)

# Why are they so strange?

# What are the row names of your dataframe?
rownames(us_exp)

# Create a column "category" that is equal to your rownames
us_exp$category <- rownames(us_exp)

# Store all "Medical and Health" expenditures in a variable
med_health <- us_exp['Medical and Health',]

# Store only your 1955 data in a varialbe -- what type of variable does it become?
spending_1955 <- us_exp[,'X1955']

# Oh no!  It's a vector!  repeat the same selection above, but:
# include "drop=FALSE" in your square brackets to keep the rownames
spending_1955 <- us_exp[,'X1955', drop=FALSE]

# How much money was spent on personal care in 1940?
care_1940 <- us_exp['Personal Care', 'X1940']

# How much money was spent on Food and Tobacco in 1960
food_1960 <- us_exp['Food and Tobacco', 'X1960']

# What was the highest expenditure category in 1960?
highest_1960 <- us_exp$category[us_exp$X1960 == max(us_exp$X1960)]

# Write a function that takes in a year as a parameter, and 
# returns the highest spending category of that year
detect_highest <- function(year) {
  return(us_exp$category[us_exp[year] == max(us_exp[year])])
}

# Using your function, determine the highest spending category of each year
highest_1950 <- detect_highest('X1950')

### Bonus ###
# Write a loop to cycle through the years, and store the highest spending category of
# each year in a list
highest <- list()
for(year in seq(1940, 1960, 5)) {
  year_index <- paste0('X', year)
  highest[year_index] <- detect_highest(year_index)
}
  
