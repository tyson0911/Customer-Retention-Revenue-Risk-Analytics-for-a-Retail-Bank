--Customer Segmentation CTE
WITH CustomerSegmentation AS (
    SELECT 
        CustomerId,
        Surname,
        CreditScore,
        Geography,
        Gender,
        Age,
        Tenure,
        Balance,
        NumOfProducts,
        HasCrCard,
        IsActiveMember,
        EstimatedSalary,
        Exited,
        Complain,
        "Satisfaction Score" AS Satisfaction_Score,
        "Card Type" AS Card_Type,
        "Point Earned" AS Point_Earned,
        -- Segmentation Logic using CASE statement
        CASE 
            WHEN Balance >= 100000 AND EstimatedSalary >= 100000 THEN 'High Value'
            WHEN Balance >= 50000 OR EstimatedSalary >= 50000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS Value_Segment,
        -- Age grouping
        CASE
            WHEN Age < 30 THEN '18-29'
            WHEN Age BETWEEN 30 AND 39 THEN '30-39'
            WHEN Age BETWEEN 40 AND 49 THEN '40-49'
            WHEN Age BETWEEN 50 AND 59 THEN '50-59'
            ELSE '60+'
        END AS Age_Group
    FROM "Customer-Churn-Records"
)

