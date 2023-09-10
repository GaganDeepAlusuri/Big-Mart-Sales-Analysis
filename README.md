# Big Mart Sales Analysis

![Big Mart Store](https://hamrolocal.s3.ap-south-1.amazonaws.com/wp-content/uploads/2021/07/08173836/big-mart-sorekhutte-600x442.jpg)

**Project Description:** 
This project focuses on analyzing and predicting sales data for Big Mart, a retail chain. It involves data preprocessing, feature engineering, and the development of predictive models to answer important business questions related to store types and city tiers.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Data Preprocessing](#data-preprocessing)
- [Feature Engineering](#feature-engineering)
- [Modeling](#modeling)
- [Results](#results)
- [Business Questions](#business-questions)
- [Usage](#usage)

## Introduction

The Big Mart Sales Analysis project aims to analyze sales data and provide insights into the factors that influence sales performance. This README provides an overview of the project, including its purpose, methodology, and key findings.

## Getting Started

### Prerequisites

To run this project, you need to have the following software and libraries installed:

- R programming environment
- Required R packages (e.g., `rio`, `corrplot`, `PerformanceAnalytics`, `dplyr`, `lme4`, `glmer`, `DHARMa`, `car`, `lmtest`, etc.)

### Installation

1. Clone this GitHub repository to your local machine.
2. Install R and the required packages mentioned in the project's R script.

## Data Preprocessing

The project starts with importing the dataset from "BigMartSales.xlsx" and performing data preprocessing tasks, such as handling missing values, converting variables into appropriate data types, and preparing the data for analysis.

## Feature Engineering

Feature engineering is a crucial step in improving the quality of the data. This project includes various feature engineering techniques, such as converting variables to factors, calculating outlet age, and selecting relevant predictor variables.

## Modeling

The project employs various regression models to predict sales and provide insights into store types and city tiers. Different models, including OLS, fixed effects, and random effects models, are used to address specific business questions.

## Results

The project's findings and insights are summarized in the R script and report. Key predictors affecting sales and the answers to the provided business questions are discussed in detail.

## Business Questions

This project answers the following business questions:

1. What type of outlet (Grocery Store or Supermarket Type 1, 2, or 3) returns the best sales, and why?
2. What type of city (Tier 1, 2, or 3) returns the best sales, and what factors influence this?
3. Who are the top 3 highest performing and lowest performing stores in the sample, and what factors contribute to their performance?

## Usage

To use this project, follow the installation instructions and run the R script. You can explore the data, models, and results to gain insights into Big Mart's sales performance.


