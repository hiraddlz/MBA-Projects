# Car Data Analysis: Fuel Efficiency and Predictive Models

Welcome to the **Car Data Analysis** repository! This project explores the relationship between various car features and fuel efficiency (MPG) using data analysis and machine learning techniques in **R**. We analyze the dataset to uncover insights, build regression models, and predict fuel efficiency.

## Table of Contents

- [Project Overview](#project-overview)
- [Data](#data)
- [Notebooks](#notebooks)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Contributing](#contributing)

## Project Overview

We crawled data from Car and Driver (caranddriver.com) to explore how various car specifications impact fuel consumption. Using R programming, I implemented a range of statistical methods to analyze the data, including ANOVA, linear regression, logistic regression, and classification and regression trees (CART). The goal was to uncover insights into how factors like horsepower, weight, engine size, and car type influence miles per gallon (MPG) performance. The primary goal is to:

1. **Explore the data** to understand the relationship between features and fuel efficiency (MPG).
2. **Visualize the data** with boxplots, histograms, and pair plots.
3. **Build predictive models**:
   - Linear regression to predict MPG based on certain features.
   - Classification models to predict high/low MPG based on certain features.
   - Decision Trees to analyze and predict MPG or car type.

## Data

The dataset used for this project is stored in the file `Final Cars Data.csv`, which contains various features of cars. It includes information like:

- **MPG (Combined.Mpg)**: Combined miles per gallon.
- **Cylinders**: Number of cylinders in the car's engine.
- **Horsepower**: The power output of the engine.
- **Displacement**: Engine displacement in cubic inches.
- **Weight**: Weight of the car in pounds.
- **Fuel System**: Type of fuel system used.
- **Type**: Car type (e.g., sedan, hatchback).

You can download the dataset from the repository and load it in your R environment.

## Notebooks

The project is organized into the following R notebooks:

1. **Data Exploration and Visualization**:
   - Boxplots, histograms, and pair plots to understand the distribution and relationships between variables.
   - Exploratory analysis of features like cylinders, horsepower, and weight.

2. **Regression Model**:
   - Building a linear regression model to predict MPG based on features like displacement and horsepower.

3. **Classification Model**:
   - Logistic regression model to predict whether a car has high or low MPG.
   - Evaluation of the model using a confusion matrix and ROC curve.

4. **Decision Trees**:
   - Running both classification and regression tree models.
   - Hyperparameter tuning with cross-validation to improve model accuracy.

5. **Model Evaluation**:
   - Performance metrics such as AUC (Area Under Curve) and accuracy are calculated for both classification and regression models.

## Usage

To run the notebooks, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/car-data-analysis.git
   ```

2. Set up your environment:
   - Install **R** and RStudio.
   - Install required R packages using:
     ```R
     install.packages(c("caTools", "rpart", "rpart.plot", "caret", "corrplot", "ROCR"))
     ```

3. Load the dataset and start exploring:
   - Run the Jupyter or RStudio notebook files provided to explore the analysis and models.

## Dependencies

To run this project, you will need the following R packages:

- `caTools`
- `rpart`
- `rpart.plot`
- `caret`
- `corrplot`
- `ROCR`

You can install these packages by running the following R command:

```R
install.packages(c("caTools", "rpart", "rpart.plot", "caret", "corrplot", "ROCR"))
```

## Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to fork the repository and submit a pull request.
