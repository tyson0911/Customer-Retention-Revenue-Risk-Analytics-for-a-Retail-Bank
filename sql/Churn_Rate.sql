-- Churn Rate by Geography, Age Group, Tenure, Card Type, and Satisfaction Score using Window Functions
ChurnAnalytics AS (
    SELECT 
        CustomerId,
        Value_Segment,
        Geography,
        Age_Group,
        Tenure,
        Card_Type,
        Satisfaction_Score,
        Exited,
        Balance,
        -- Window functions to calculate totals and churns per dimension
        COUNT(CustomerId) OVER (PARTITION BY Geography) AS Total_Geo_Customers,
        SUM(Exited) OVER (PARTITION BY Geography) AS Churned_Geo_Customers,
        
        COUNT(CustomerId) OVER (PARTITION BY Age_Group) AS Total_Age_Customers,
        SUM(Exited) OVER (PARTITION BY Age_Group) AS Churned_Age_Customers,
        
        COUNT(CustomerId) OVER (PARTITION BY Tenure) AS Total_Tenure_Customers,
        SUM(Exited) OVER (PARTITION BY Tenure) AS Churned_Tenure_Customers,
        
        COUNT(CustomerId) OVER (PARTITION BY Card_Type) AS Total_Card_Customers,
        SUM(Exited) OVER (PARTITION BY Card_Type) AS Churned_Card_Customers,
        
        COUNT(CustomerId) OVER (PARTITION BY Satisfaction_Score) AS Total_Satisfaction_Customers,
        SUM(Exited) OVER (PARTITION BY Satisfaction_Score) AS Churned_Satisfaction_Customers
    FROM CustomerSegmentation
)

