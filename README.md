# 🎓 Admission Prediction using Machine Learning & Prolog

## 📌 Project Overview

This project predicts the likelihood of a student getting admitted into a university based on academic and profile features such as GRE score, TOEFL score, CGPA, and more. It utilizes both:

- A **regression-based machine learning approach** for predicting the *chance of admission* as a continuous probability.
- A **Prolog-based rule system** implementing a decision tree logic to classify admission as *Yes* or *No* based on input thresholds.

---

## 🎯 Objectives

- Analyze key factors influencing graduate school admissions.
- Build a regression model to predict the **chance of admission**.
- Implement a symbolic logic system to classify admission decisions using Prolog.
- Evaluate and optimize model performance using appropriate metrics.
- Provide an interactive Prolog interface for rule-based admission prediction.

---

## 📂 Dataset Description

The dataset includes various student attributes:

| Feature                | Description                                 |
|------------------------|---------------------------------------------|
| GRE Score              | Graduate Record Exam score (out of 340)     |
| TOEFL Score            | Test of English as a Foreign Language score |
| University Rating      | Rating of university (1 to 5)               |
| SOP                   | Statement of Purpose strength (1 to 5)      |
| LOR                   | Letter of Recommendation strength (1 to 5)  |
| CGPA                  | Undergraduate GPA (out of 10)               |
| Research              | Research experience (0 = No, 1 = Yes)       |
| Chance of Admit       | Target variable (probability from 0 to 1)   |

---

## 📊 Exploratory Data Analysis (ML Model)

- Visualized features against `Chance of Admit`.
- Identified CGPA, GRE, TOEFL, and Research as strong predictors via correlation heatmaps.

---

## 🧹 Data Preprocessing (ML Model)

- Handled missing values and outliers.
- Scaled numeric features using StandardScaler.
- No categorical encoding required for binary research feature.

---

## 📈 Model Building (ML Model)

### Models Tried:
- Linear Regression (baseline)
- Ridge Regression
- Lasso Regression
- Random Forest Regressor

### Evaluation Metrics:
- R² Score
- Mean Absolute Error (MAE)
- Mean Squared Error (MSE)
- Root Mean Squared Error (RMSE)

### Results:
- Random Forest performed best, achieving R² > 0.85.
- Ridge and Lasso helped reduce overfitting.
- Linear Regression provided a solid baseline.

---

## 🧪 Hyperparameter Tuning (ML Model)

- Used GridSearchCV to optimize Ridge alpha and Random Forest parameters.
- Best results with tuned Random Forest.

---

## 🤖 Prolog-Based Admission Prediction

- Implements a **decision tree logic** in Prolog using dynamic predicates.
- Accepts user inputs interactively: GRE, TOEFL, CGPA, SOP, LOR, University Rating, and Research experience.
- Applies defined admission rules based on thresholds to classify **admission as Yes or No**.
- Useful for explainable, rule-based decision making alongside machine learning predictions.
- Provides an educational example of symbolic AI in admission prediction.

---

## 📊 Summary of Model Performance

| Model                | R² Score | RMSE   | MAE    |
|----------------------|----------|--------|--------|
| Linear Regression    | ~0.80    | ~0.05  | ~0.04  |
| Random Forest        | ~0.85+   | ~0.03  | ~0.025 |
| Ridge/Lasso          | ~0.78–0.82 | ~0.04 | ~0.035 |

---

## 📂 Project Structure

- Data Analysis and Machine Learning code (Python notebooks/scripts)
- Prolog knowledge base and user interaction script for rule-based admission
- Documentation and reports summarizing insights and model evaluations

👨‍💻 Author
Krunal Patel
https://github.com/Krunalscorp
