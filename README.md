# **Employee Attrition Analysis and Prediction**

This repository contains an analysis of employee attrition within the healthcare sector. The study leverages statistical modeling techniques and optimization tools to uncover key factors influencing attrition, evaluate predictive models, and propose actionable strategies to enhance employee retention. Below, you'll find a detailed overview of the project, methodology, and insights.


## **Introduction**
This project investigates the factors contributing to employee attrition in the healthcare sector. Using data preprocessing, exploratory data analysis (EDA), and predictive modeling, the study identifies high-risk groups and provides strategic recommendations to improve workforce stability and satisfaction.


### **Dataset Details**
The dataset includes **1,470 entries** with 35 attributes covering some key factors:   
- **`JobSatisfaction`**: Employee’s job satisfaction score (scale: 1-4).  
- **`OverTime`**: Whether the employee frequently works overtime (Yes/No).  
- **`MonthlyIncome`**: Monthly income of employees (numeric).  
- **`Attrition`**: Target variable indicating whether an employee left the organization (Yes/No).  


### **Steps**
1. **Data Cleaning**:  
   - Addressed missing values and outliers.  
   - Encoded categorical variables like `Attrition` and `OverTime`.  
2. **EDA**:  
   - Visualised attrition rates across variables such as job satisfaction, overtime, and income levels.  
3. **Statistical Modeling**:  
   - Built and evaluated logistic regression models for predicting attrition.  
4. **Optimisation**:  
   - Used Python Gurobi to explore strategies for reducing attrition, focusing on budget allocation for wellness programs and flexible work arrangements.  


## **Analysis Overview**
The analysis focuses on:  
1. **Data Trends**:  
   - Visualised the relationship between attrition and factors such as overtime and job satisfaction.  
   - Highlighted high-risk groups based on demographic and job-related attributes.  
2. **Model Accuracy**:  
   - Achieved 93% accuracy with logistic regression.  
   - Evaluated using precision, recall, and F1-score.  
3. **Optimised Strategies**:  
   - Explored cost-effective retention strategies to reduce attrition rates.  


## **Key Findings**
1. **High-Risk Groups**:  
   - Employees with low job satisfaction and frequent overtime are most likely to leave.  
   - Monthly income and career growth opportunities significantly influence attrition.  
2. **Retention Strategies**:  
   - Wellness programs and flexible work options can reduce attrition rates from **16% to 10%**.  
3. **Insights**:  
   - Targeted investments in employee satisfaction lead to measurable improvements in retention.  


## **Models and Results**
This study used logistic regression as the primary predictive model:  
- **Logistic Regression**: Achieved 93% accuracy.  
- **Evaluation Metrics**: Precision, recall, and F1-scores demonstrated the model's effectiveness.  
- **Optimisation Results**: Gurobi simulations revealed optimal budget allocation for retention strategies.


## **Conclusion**
- **Predictors of Attrition**: Factors like job satisfaction and overtime are critical indicators.  
- **Strategic Recommendations**: Wellness programs and flexible work arrangements improve retention.  
- **Model Effectiveness**: Logistic regression provides actionable insights but requires further refinement for higher precision.  
