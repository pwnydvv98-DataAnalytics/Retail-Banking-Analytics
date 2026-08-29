--- Data Ananlysis----

use banking_clean;

--- 1 Total Customers
select count(*) as Total_Customers from banking_clean.customer_clean;

--- 2. Total accounts
select count(*) as Total_Accounts from banking_clean.account_clean;

--- 3. Total_Transactions
select count(*) as Total_Transactions from banking_clean.transaction_clean;

--- 4. Total Transaction Amount
select round(sum(Amount),2) as Total_Transaction_Amount from banking_clean.transaction_clean; 

--- 5. Average_Transaction_Amount
select round(avg(amount),2) as Avg_Txn_Amount from banking_clean.transaction_clean;

--- 6. Minimum and Maximum Transaction
select 
	min(Amount) as Minimum_Txn_Amount,
    max(Amount) as Maximum_Txn_Amount
from banking_clean.transaction_clean;

--- 7. Account Type Analysis
select 
	Account_Type,
    count(*) as Total_Account,
    round(sum(Balance),2) as Total_Balance,
    round(avg(Balance),2) as Avg_Balance
from banking_clean.account_clean group by Account_Type order by Total_Account desc;

--- 8. Account Status
select 
	Account_Status,
    count(*) as Total_Account
from banking_clean.account_clean group by Account_Status order by Total_Account desc;

--- 9. Transaction Type Analysis
select 
	Transaction_Type,
    count(*) as Transaction_Count,
    round(sum(Amount),2) as Total_Amount,
    round(avg(Amount),2) as Avg_Amount
from banking_clean.transaction_clean group by Transaction_Type order by Total_Amount desc;

--- 10 Channel Analysis
select 
	`Channel`,
    count(*) as Total_Txn,
    round(sum(Amount),2) as Total_Amount
from banking_clean.transaction_clean group by `Channel` order by Total_Txn;

--- 11. Transaction Status
select 
	Transaction_Status,
    count(*) as Total_Txn,
    round(sum(Amount),2) as Total_Amount
from banking_clean.transaction_clean group by Transaction_Status order by Total_txn desc;


--- 12. Monthly Transaction Trend
select 
	date_format(Transaction_Date,'%Y-%m') as `Month`,
    count(*) as Total_txn,
    round(sum(Amount),2) As Total_Amount
from banking_clean.transaction_clean
where Transaction_Date is not null 
group by date_format(Transaction_Date,'%Y-%m') order by `Month`;

--- 13. Yearly Transaction trend
select 
	year(Transaction_Date) as `Year`,
    count(*) as Transaction_Count,
    round(sum(Amount),2) as Total_Amount
from banking_clean.transaction_clean
where Transaction_Date is not null group by year(Transaction_Date) order by `Year`;

--- 14. Top 10 Customer by Transaction Amount
select 
	Customer_ID,
    count(*) as Total_txn,
    round(sum(Amount),2) as Total_Txn_Amount
from banking_clean.transaction_clean
group by Customer_ID order by Total_Txn_Amount desc limit 10;

--- 15. Top Customers with Names
select 
	c.Customer_ID,
    c.Customer_Name,
    count(t.Transaction_ID) as Txn_Count,
    round(sum(t.Amount),2) as Total_Txn_Amount
from banking_clean.customer_clean c 
join banking_clean.transaction_clean t
on c.Customer_ID = t.Customer_ID 
group by c.Customer_ID,c.Customer_Name order by Total_Txn_Amount desc limit 10;

--- 16 Branch Performance
select 
	b.Branch_ID,
    b.Branch_Name,
    b.City,
    b.State,
    count(t.Transaction_ID) as Total_txn_Count,
    round(sum(t.Amount),2) as Total_Txn_Amount
from banking_clean.branches_clean b 
left join banking_clean.transaction_clean t
on b.Branch_ID = t.Branch_ID
group by b.Branch_ID ,b.Branch_Name,b.City,b.State order by Total_Txn_Amount desc;

--- 17 Loan_Analysis
select 
	Loan_Type,
    count(*) as Total_Loan,
    round(sum(Loan_Amount),2) as Total_Loan_Amount,
    round(avg(Loan_Amount),2) as Avg_Loan_Amount
from banking_clean.loans_clean
group by Loan_Type order by Total_Loan_Amount desc;

--- 18. Loan_Status
select 
	Loan_Status,
    count(*) as Loan_Count,
    round(sum(Loan_Amount),2) as Total_Loan_Amount
from banking_clean.loans_clean 
group by Loan_Status order by Loan_Count desc;

--- 19. Defaulted Loan Analysis
select 
	count(*) as Defaulted_Loan,
    round(sum(Loan_Amount),2) as Defaulted_Loan_Amount
from banking_clean.loans_clean
where Loan_Status = 'Defaulted';

--- 20. Card Analysis
select 
	Card_Type,
    count(*) as Total_Card
from banking_clean.cards_clean
group by Card_Type order by Total_Card desc ;

--- 21. Card_Status
select 
	Card_Status,
    count(*) as Total_Card
from banking_clean.cards_clean
group by Card_Status order by Total_Card desc;

--- 22. Employee Analysis
select 
	Department,
    count(*) as Emp_Count,
    round(sum(Salary),2) as Total_Salary,
    round(avg(Salary),2) as Avg_Salary
from banking_clean.employees_clean
group by Department order by Emp_Count desc;

--- 23. Branch Employee Performance 
select 
	b.Branch_ID,
    b.Branch_Name,
    count(e.Employee_ID) as Emp_Count,
    round(avg(e.Salary),2) as Avg_Salary
from banking_clean.branches_clean b
left join banking_clean.employees_clean e
on b.Branch_ID = e.Branch_ID
group by b.Branch_ID,b.Branch_Name
order by Emp_Count desc ;

--- 24. Customer Account + Balance Analysis
select 
	c.Customer_ID,
    c.Customer_Name,
    count(a.Account_ID) as Account_Count,
    round(sum(a.Balance),2) as Total_Balance
from banking_clean.customer_clean c 
join banking_clean.account_clean a
on c.Customer_ID = a.Customer_ID
group by c.Customer_ID,c.Customer_Name order by Total_Balance desc limit 20;

--- 25. Customer + Loan Analysis
select 
	c.Customer_ID,c.Customer_Name,
    count(l.Loan_ID) as Loan_Count,
    round(sum(l.Loan_Amount),2) as Total_Loan_Amt
from banking_clean.customer_clean c 
join banking_clean.loans_clean l 
on c.Customer_ID = l.Customer_ID
group by c.Customer_ID,c.Customer_Name order by Total_Loan_Amt desc limit 20;

--- 26. Customers with both Account And Loans
select 
	c.Customer_ID,c.Customer_Name,
    count(distinct a.Account_ID) as Account_Count,
    count(distinct l.Loan_ID) as Loan_Count,
    round(sum(distinct a.Balance),2) as Total_Balance,
    round(sum(distinct l.Loan_Amount),2) as Total_Loan_Amt
from banking_clean.customer_clean c 
left join banking_clean.account_clean a
on c.Customer_ID = a.Customer_ID
left join banking_clean.loans_clean l 
on c.Customer_ID = l.Customer_ID
group by c.Customer_ID,c.Customer_Name
having Loan_Count > 0 order by Total_Loan_Amt desc limit 20;

--- 27. Successful Transaction Rate 
select 
	round(100*sum(Transaction_Status = 'Success')/Count(*),2) as Success_Rate_Percentage
from banking_clean.transaction_clean;
 
--- 28. Failed Txn Rate
select 
	round(100*sum(Transaction_Status ='Failed')/count(*),2) as Failed_Txn_rate
from banking_clean.transaction_clean;

--- 29. UPI Analysis
select 
	count(*) as Upi_Txn,
    round(sum(Amount),2) as Total_Amount,
    round(avg(Amount),2) as Avg_Amount
from banking_clean.transaction_clean 
where `Channel` = 'UPI';

--- 30. Monthly Txn + Status Analysis
select 
	date_format(Transaction_Date,'%Y-%m') as `Month`,
    Transaction_Status, count(*) as Txn_Count,
    round(sum(Amount),2) as Total_Amt
from banking_clean.transaction_clean
where Transaction_Date is not null
group by date_format(Transaction_Date,'%Y-%m'),Transaction_Status order by `Month`, Transaction_Status;


------------------------------------------------------------- --------------------------------------------- -----------------
--- 31. Month over Month Growth

with Monthly_Summary as (
	select 
		date_format(Transaction_Date,'%Y-%m') as Txn_Month,
        count(*) as Total_Txn,
        round(sum(Amount),2) as Total_Amt
	from banking_clean.transaction_clean
    where Transaction_Date is not null
    group by date_format(Transaction_Date,'%Y-%m')
)
select 
	Txn_Month,Total_Txn,Total_Amt,
    lag(Total_Amt,1) over (order by Txn_Month) as Pre_Month_Amt,
    round(((Total_Amt-lag(Total_Amt,1) over (order by Txn_Month))
    /lag(Total_Amt,1) over (order by Txn_Month))*100,2) as MOM_Growth_Percentage
from Monthly_Summary order by Txn_Month;

--- 32.  Top 3 Spending Customer Per Branch

with Customer_Branch_Spending as (
select 
	b.Branch_ID,b.Branch_Name,
    c.Customer_ID,c.Customer_Name,
    round(sum(t.Amount),2) as Total_Spent,
    dense_rank()over(partition by b.Branch_ID order by sum(t.Amount) desc) as Spending_rank
from banking_clean.customer_clean c
join banking_clean.transaction_clean t on c.Customer_ID = t.Customer_ID
join banking_clean.branches_clean b on b.Branch_ID = t.Branch_ID
group by b.Branch_ID,b.Branch_Name,c.Customer_ID,c.Customer_Name
)
select 
	Branch_ID,Branch_Name,
    Customer_ID,Customer_Name,
    Total_Spent,Spending_rank 
from Customer_Branch_Spending where Spending_rank <= 3
order by Branch_ID,Spending_rank;

--- 33. Multi Product Balance and Loan Summary
with Customer_Account as (
select 
	Customer_ID,
    count(Account_ID) as Account_Count,
    sum(Balance) as Total_Balance
from banking_clean.account_clean group by Customer_ID ),
Customer_Loan as (
select 
	Customer_ID,
    count(Loan_ID) as Loan_Count,
    sum(Loan_Amount) as Total_Loan
from banking_clean.loans_clean group by Customer_ID)
select 
	c.Customer_ID,c.Customer_Name,
    coalesce(ca.Account_Count,0) as Account_count,
    round(coalesce(ca.Total_Balance,0),2) as Total_Balance,
    coalesce(cl.Loan_Count,0) as Loan_Count,
    round(coalesce(cl.Total_Loan,0),2) as Total_Loan_Amount
from banking_clean.customer_clean c
left join Customer_Account ca on c.Customer_ID = ca.Customer_ID
left join Customer_Loan cl on c.Customer_ID = cl.Customer_ID 
where cl.Loan_Count > 0
order by Total_Loan_Amount desc limit 20;

--- 34. Customer Recency ,Frequency And Monetary Value (RFM)
with Customer_RFM as (
	select 
		Customer_ID,
        datediff((select max(Transaction_Date) from banking_clean.Transaction_Clean),max(Transaction_Date)) as Recency_Days,
        count(Transaction_ID) as Frequency,
        round(sum(Amount),2) as Monetary_Value
	from banking_clean.transaction_clean
    where Transaction_ID is not null group by Customer_ID
),
RFM_Score as (
	select 
		Customer_ID,
        Recency_Days,
        Frequency,
        Monetary_Value,
        ntile(4)over (order by Recency_Days asc) as r_score,
        ntile(4)over(order by Frequency desc) as f_score,
        ntile(4)over(order by Monetary_Value desc) as m_score
	from Customer_RFM
)
select
	Customer_ID,
    Recency_Days,
    Frequency,
    Monetary_Value,
    (r_score + f_score + m_score) as Total_RFM_Score,
    case
		when (r_score + f_score + m_score) > 10 then 'Platinum High Value'
        when (r_score + f_score + m_score) between 7 and 9 then 'Good Active'
        when (r_score + f_score + m_score) between 4 and 6 then 'Silver Regular'
        else 'Bronze/At Risk'
	end as Customer_Tier
from RFM_Score order by Total_RFm_Score desc limit 50;

--- 35. Dormant Account Identification

with latest_Dataset_Date as (
	select max(Transaction_Date) as Max_Date
    from banking_clean.transaction_clean
),
Account_Last_Activity as (
	select
		Account_ID,
        max(Transaction_Date) as Last_Transaction_Date
	from banking_clean.transaction_clean
    group by Account_ID
)
select 
	a.Account_ID,a.Customer_ID,a.Account_type,a.Balance,
    coalesce(ala.Last_Transaction_Date,a.Opening_Date) as Last_Active_Date,
    datediff(ldd.Max_Date,coalesce(ala.Last_Transaction_Date,a.Opening_Date)) as Days_Inactive
from banking_clean.account_clean a
cross join Latest_Dataset_Date ldd
left join Account_Last_Activity ala on a.Account_ID = ala.Account_ID
where a.Account_Status = 'Active'
and(ala.Last_Transaction_Date is null
or datediff(ldd.Max_Date,ala.Last_Transaction_Date) > 90
)
order by Days_Inactive desc limit 50;

