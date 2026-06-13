-- Top Churn Drivers: Finding combinations of Geography and Age Group with highest churn
SELECT 
    Geography,
    Age_Group,
    COUNT(CustomerId) AS Segment_Population,
    SUM(Exited) AS Churned_Count,
    ROUND(SUM(Exited) * 100.0 / COUNT(CustomerId), 2) AS Churn_Rate_Percentage,
    SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END) AS Revenue_Lost
FROM CustomerSegmentation
GROUP BY Geography, Age_Group
HAVING COUNT(CustomerId) > 50 -- Filter for meaningful segment sizes
ORDER BY Churn_Rate_Percentage DESC
LIMIT 10;