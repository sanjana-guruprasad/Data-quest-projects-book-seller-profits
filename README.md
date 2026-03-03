# Book Review Profitability Analysis

## Project Overview

This project analyzes a dataset of book reviews to determine which book generated the most revenue. The dataset contains 2,000 rows and 4 columns — `book`, `review`, `state`, and `price` — and was loaded and explored using R.

The goal is to clean and standardize the data, convert qualitative review ratings into numerical scores, and calculate total revenue per book to identify the most profitable title. The analysis was completed using the `tidyverse` package in R.

---

## Research Questions

1. Which book generated the highest total revenue based on sales volume and price?
2. Which books received the highest proportion of positive reviews from customers?

---

## Methodology and Technical Workflow

**Step 1 — Load and Explore the Data**

The dataset is imported using `read.csv()` and stored as `book_reviews`. The `glimpse()` function is used to confirm the structure: 2,000 rows across 4 columns (`book`, `review`, `state`, `price`).

**Step 2 — Remove Missing Values**

Rows containing any missing values across all four columns are removed using `filter()` with `if_all()`. The cleaned dataset is stored as `filtered_reviews`.

**Step 3 — Standardize State Names**

The `state` column contains inconsistent entries mixing full state names and abbreviations. The `recode()` function inside `mutate()` is used to convert all full names to their two-letter abbreviations: `New York` to `NY`, `Florida` to `FL`, `Texas` to `TX`, and `California` to `CA`.

**Step 4 — Convert Reviews to Numerical Scores**

The text-based review ratings are converted to a numeric scale using `case_when()` inside `mutate()`. The mapping is: `Poor` = 1, `Fair` = 2, `Good` = 3, `Great` = 4, `Excellent` = 5. The result is stored in a new column called `review_num`.

**Step 5 — Flag High Reviews**

A new boolean column, `is_high_review`, is created using `ifelse()` to mark any book with a `review_num` of 4 or higher as `TRUE`.

**Step 6 — Calculate Revenue Per Book**

Total revenue for each book is calculated by multiplying its unit count by its listed price.

```r
Fundamentals <- 366 * 39.99   # Fundamentals of R For Beginners
Dummies      <- 361 * 15.99   # R For Dummies
Easy         <- 352 * 19.99   # R Made Easy
Advanced     <- 360 * 50.00   # Secrets Of R For Advanced Students
Mistakes     <- 355 * 29.99   # Top 10 Mistakes R Beginners Make
```

---

## Key Findings

| Book | Units | Price | Total Revenue |
|---|---|---|---|
| Fundamentals of R For Beginners | 366 | $39.99 | $14,636.34 |
| R For Dummies | 361 | $15.99 | $5,772.39 |
| R Made Easy | 352 | $19.99 | $7,036.48 |
| **Secrets Of R For Advanced Students** | **360** | **$50.00** | **$18,000.00** |
| Top 10 Mistakes R Beginners Make | 355 | $29.99 | $10,646.45 |

**Secrets Of R For Advanced Students** was the most profitable book at $18,000 in total revenue. Despite not having the highest unit count, its premium $50.00 price point drove it to the top. R For Dummies sold the second-highest number of units but ranked last in revenue due to its low price of $15.99, illustrating that volume alone does not determine profitability.

---

## Requirements and Setup

**Language:** R (version 4.0 or higher recommended)  
**IDE:** RStudio

**Required packages:**

```r
install.packages("tidyverse")
```

| Package | Use |
|---|---|
| `tidyverse` | Data cleaning, filtering, and transformation |
| `readr` | Importing the CSV dataset |

**To run the analysis:**

1. Download `book_reviews.csv` and note its file path
2. Open the project script in RStudio
3. Update the file path in `read.csv()` to match your local machine
4. Run `install.packages("tidyverse")` if not already installed
5. Run the script from top to bottom to reproduce all results
