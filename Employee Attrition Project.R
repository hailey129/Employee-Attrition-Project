rm(list=ls())

install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)

df <- read.csv("Dataset.csv")


# Demographic analysis

# 'Attrition' is a factor variable
df$Attrition <- as.factor(df$Attrition)

# Calculate the median age
median_age <- median(df$Age)
median_age_no <- median(df$Age[df$Attrition == "No"])
median_age_yes <- median(df$Age[df$Attrition == "Yes"])

# Plot 1: Age Distribution
p1 <- ggplot(df, aes(x = Age)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "white") +
  geom_vline(aes(xintercept = median_age), color = "blue", linetype = "dashed") +
  annotate("text", x = median_age, y = 80, label = paste("Median:", median_age), color = "blue", vjust = -1) +
  labs(title = "Age Distribution", x = "Age", y = "Count") +
  theme_minimal()

# Plot 2: Attrition by Age
p2 <- ggplot(df, aes(x = Age, fill = Attrition)) +
  geom_histogram(binwidth = 2, position = "fill", color = "white") +
  scale_fill_manual(values = c("No" = "skyblue", "Yes" = "red")) +
  geom_vline(aes(xintercept = median_age_no), color = "darkgreen", linetype = "dashed") +
  geom_vline(aes(xintercept = median_age_yes), color = "blue", linetype = "dashed") +
  annotate("text", x = median_age_no, y = 0.3, label = paste("Median (No):", median_age_no), color = "darkgreen", vjust = -1) +
  annotate("text", x = median_age_yes, y = 0.5, label = paste("Median (Yes):", median_age_yes), color = "darkred", vjust = -1) +
  labs(title = "Attrition by Age", x = "Age", y = "Proportion") +
  theme_minimal()

# Display the plots
library(gridExtra)
grid.arrange(p1, p2, ncol = 2)


# 'Gender' and 'MaritalStatus' are factor variables
df$Gender <- as.factor(df$Gender)
df$MaritalStatus <- as.factor(df$MaritalStatus)

# Plot 3: Gender Distribution by Attrition
p3 <- ggplot(df, aes(x = Gender, fill = Attrition)) +
  geom_bar(position = "dodge") +
  ggtitle("Attrition by Gender") +
  xlab("Gender") +
  ylab("Count") +
  theme_minimal() +
  scale_fill_manual(values = c("skyblue", "red"))


# Plot 4: Marital Status Distribution by Attrition
p4 <- ggplot(df, aes(x = MaritalStatus, fill = Attrition)) +
  geom_bar(position = "fill") +
  ggtitle("Attrition by Marital Status") +
  xlab("Marital Status") +
  ylab("Proportion") +
  theme_minimal() +
  scale_fill_manual(values = c("skyblue", "red"))

library(gridExtra)
grid.arrange(p3, p4, ncol = 2)



# Compensation analysis

# Attrition by Percent Salary Hike - not included - testing part
ggplot(df, aes(x = factor(PercentSalaryHike), fill = Attrition)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("No" = "skyblue", "Yes" = "red")) +
  labs(title = "Attrition by Percent Salary Hike",
       x = "Percent Salary Hike",
       y = "Count of Employees",
       fill = "Attrition") +
  theme_minimal()


# MonthlyIncome and Attrition by Job Level
ggplot(df, aes(x = MonthlyIncome, y = reorder(JobLevel, MonthlyIncome, FUN = median), color = Attrition, size = ifelse(Attrition == "Yes", 2, 1))) +
  geom_jitter(alpha = 0.6, width = 0.2) +
  scale_color_manual(values = c("Yes" = "red", "No" = "skyblue")) +
  scale_size(range = c(1, 5), guide = "none") +
  labs(x = "Monthly Income", y = "Job Level", title = "Monthly Income and Attrition by Job Level") +
  theme_minimal() 




# Tenure analysis

# Plot the density of Years at Company
p5 <- ggplot(df, aes(x = YearsAtCompany)) +
  geom_density(fill = "lightblue", alpha = 0.4) +
  geom_vline(aes(xintercept = median(YearsAtCompany, na.rm = TRUE)),
             color = "blue", linetype = "dashed", size = 1.2) +
  annotate("text", x = median(df$YearsAtCompany, na.rm = TRUE), y = 0.15,
           label = paste("Median:", median(df$YearsAtCompany, na.rm = TRUE)),
           color = "blue", vjust = -0.5, hjust = -0.2, size = 4) +
  labs(title = "Years at Company Distribution",
       x = "Years at Company",
       y = "Density") +
  theme_minimal()


# Plot the density of Years at Company by Attrition status
p6 <- ggplot(df, aes(x = YearsAtCompany, fill = Attrition)) +
  geom_density(alpha = 0.5) +
  geom_vline(data = df[df$Attrition == "Yes", ],
             aes(xintercept = median(YearsAtCompany, na.rm = TRUE)),
             color = "red", linetype = "dashed", size = 1.2) +
  geom_vline(data = df[df$Attrition == "No", ],
             aes(xintercept = median(YearsAtCompany, na.rm = TRUE)),
             color = "darkgreen", linetype = "dashed", size = 1.2) +
  annotate("text", x = median(df$YearsAtCompany[df$Attrition == "Yes"], na.rm = TRUE), 
           y = 0.1, label = paste("Median (Yes):", median(df$YearsAtCompany[df$Attrition == "Yes"], na.rm = TRUE)),
           color = "red", vjust = -3, hjust = -0.2, size = 4) +
  annotate("text", x = median(df$YearsAtCompany[df$Attrition == "No"], na.rm = TRUE), 
           y = 0.1, label = paste("Median (No):", median(df$YearsAtCompany[df$Attrition == "No"], na.rm = TRUE)),
           color = "darkgreen", vjust = -1, hjust = -0.2, size = 3.5) +
  scale_fill_manual(values = c("No" = "skyblue", "Yes" = "red")) +
  labs(title = "Attrition by Years at Company",
       x = "Years at Company",
       y = "Density") +
  theme_minimal()

# Arrange the plots side by side
grid.arrange(p5, p6, ncol = 2)



# Load necessary libraries
install.packages("GGally")

# Load necessary packages
library(GGally)
library(ggplot2)

# Define the custom color scale for Attrition
attrition_colors <- c("No" = "skyblue", "Yes" = "red")

# Create the ggpairs plot with custom colors
ggpairs(
  df, 
  columns = c("MonthlyIncome", "JobLevel", "TotalWorkingYears", "YearsAtCompany", "YearsWithCurrManager", "Attrition"), 
  aes(color = as.factor(Attrition), fill = as.factor(Attrition)),
  upper = list(continuous = "points"),
  lower = list(continuous = "smooth")
) +
  scale_fill_manual(values = attrition_colors) +
  scale_color_manual(values = attrition_colors) +
  theme_minimal() +
  labs(color = "Attrition", fill = "Attrition")

