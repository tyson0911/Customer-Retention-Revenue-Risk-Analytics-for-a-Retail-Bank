-- Revenue at Risk by Customer Segment
SELECT 
    Value_Segment,
    COUNT(CustomerId) AS Total_Segment_Customers,
    SUM(Exited) AS Total_Churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(CustomerId), 2) AS Churn_Rate_Pct,
    -- Revenue at risk defined as the sum of balance from churned customers
    SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END) AS Revenue_At_Risk
FROM CustomerSegmentation
GROUP BY Value_Segment
ORDER BY Revenue_At_Risk DESC;


