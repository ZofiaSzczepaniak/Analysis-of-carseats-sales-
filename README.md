# Analysis-of-carseats-sales-
Comprehensive analysis of sales of carseats based on open source data. The goal was to find key features that influence a product’s sales. To derive that, importances obtained by the decision tree were used. Low maximal tree depth puts more emphasis on interpretability over complexity.

##  Key Objectives
###  Classification: High vs. Low Sales
I define "high sales" as sales exceeding 8 units and use a classification tree to predict this binary outcome.

![ex1_b](https://github.com/user-attachments/assets/6e3c103f-a3cc-4a1e-b0a4-0ff95452c453)


Top Predictors Identified:

- ShelveLoc (Shelf Location Quality)

- Price

### Best-performing segment:

- If ShelveLoc is "Good" and Price < 150, the probability of high sales is 86.8%.

### Performance Metrics:

- Training Misclassification Rate: 22.7%

- Test Misclassification Rate: 26%

###  Analysis:
The model confirms intuitive retail insights — product placement and pricing are critical drivers of sales. The small increase in test error suggests good generalization and minimal overfitting, especially considering the tree's simplicity. However, the classification boundary is coarse due to the depth limit, and some predictive nuance is lost. Misclassified examples likely fall near the decision thresholds, indicating possible benefits from allowing deeper trees or using probabilistic models like random forests.

##  Regression: Predicting Sales Volume
Here, we treat Sales as a continuous variable and fit a regression tree model.

![ex2_b](https://github.com/user-attachments/assets/d1125455-e5fc-4e90-9303-ec148cebafd8)

Top Predictors Identified:

- ShelveLoc

- Price

### Segment with Highest Average Sales:

- ShelveLoc = "Good" and Price < 109.5 → Average Sales = 11.91 units

### Root Mean Squared Error (RMSE):

- Training RMSE: Moderate (exact value reported in results)

- Test RMSE: Slightly higher, indicating some loss in predictive precision

### Analysis:
The regression model again emphasizes shelf visibility and pricing strategy as primary levers for increasing unit sales. The spread of points around the ideal line in the observed vs. predicted plot (plot below) shows notable prediction error, suggesting unmodeled complexity in the data. The limited depth results in broad groupings, so individual variation is not captured well—this is a trade-off for interpretability.

![ex2_d](https://github.com/user-attachments/assets/ceacb146-4f67-4750-bf91-343e000c2c47)

## Business Implications:
The analysis gives clear, actionable insights: improve product shelf location and maintain competitive pricing to drive sales.

## Instructions: 
First, to use the programs, one must install the R compiler. To do so, enter the site and follow the given steps: https://posit.co/download/rstudio-desktop/.





