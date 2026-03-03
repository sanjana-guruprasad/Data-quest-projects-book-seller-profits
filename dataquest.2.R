install.packages("tidyverse")
library(tidyverse)
library(readr)
#The goal is to judge the most profitable book

#Start by loading the data and understanding the characteristics of the table
book_reviews <- read.csv("C:\\Users\\Sanjana\\Downloads\\book_reviews (1).csv")
glimpse (book_reviews)
# 2000 rows and 4 columns
#Column names are book, review, state, and price

#Filter the dtaa to remove missing values
filtered_reviews <- book_reviews %>%
  filter(if_all(c(book, review, state, price), ~ !is.na(.)))
filtered_reviews

view(filtered_reviews$state)

#Correcting the values of state names to make all the names consistent
filtered_reviews <- filtered_reviews %>%
mutate(state = recode(state,
       "New York" = "NY",
         "Florida" = "FL",
         "Texas" = "TX",
         "California" = "CA"))
filtered_reviews

#Recoding string characters as numericals
filtered_reviews <- filtered_reviews %>%
 mutate(review_num = case_when(
   review == "Poor" ~ 1,
   review == "Fair" ~ 2,
   review == "Good" ~ 3,
   review == "Great" ~ 4,
   review == "Excellent" ~ 5
 )) 
filtered_reviews

filtered_reviews <- filtered_reviews %>%
  mutate(is_high_review = ifelse(review_num >= 4, "TRUE", "FALSE"))
filtered_reviews

view(filtered_reviews)

book_counts <- filtered_reviews %>%
count(book)
book_counts

Fundamentals <- 366*39.99
Dummies <- 361*15.99
Easy <- 352*19.99
Advanced <- 360*50
Mistakes <- 355*29.99

Fundamentals
Dummies
Easy
Advanced
Mistakes

#The most profitable book is Secrets Of R For Advanced Students