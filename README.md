# Conjoint Analysis for Consumer Preferences

# Overview
This repository contains an R script that performs Conjoint Analysis, a technique used to understand consumer preferences for various product attributes. The analysis calculates part-worth utilities for attributes such as brand, shipping cost, restocking fee, return period, and price, helping businesses optimize their offerings.

# Key Features of the Analysis
- Attributes and Levels:
- Brand: CR, Apple, Samsung, FitBit
- Shipping Cost: $0, $10, $20
- Restocking Fee: 0%, 5%, 10%, 15%
- Return Period: 7 days, 14 days, 21 days
- Price: $150, $200, $250, $300

# Experimental Design:
A fractional factorial design is created to reduce the number of combinations while maintaining statistical validity.

# Part-Worth Utilities:
Calculates and adjusts part-worth utilities for each respondent to reveal consumer preferences.

# Results:
Outputs a CSV file (conjoint_partworths.csv) containing part-worth utilities for each attribute level.

# Applications
This analysis can be applied to:
-  Product design and pricing strategy.
- Understanding trade-offs consumers are willing to make between attributes.
