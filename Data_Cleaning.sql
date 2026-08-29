use banking;
--- 1. total_rows count check 
select count(*) as total_rows from accounts_raw;
select count(*) as total_rows from branches_raw;
select count(*) as total_raw from cards_raw;
select count(*) as total_raw from customers_raw;
select count(*) as total_rows from employees_raw;
select count(*) as total_rows from loans_raw;
select count(*) as total_rows from transactions_raw;

--- 2. check the table structure
describe accounts_raw;
describe branches_raw;
describe cards_raw;
describe customers_raw;
describe employees_raw;
desc loans_raw;
desc transactions_raw;

--- 3.check null values
select 
	sum(Account_ID is null) as Account_ID_null,
    sum(Customer_ID is null) as Customer_ID_null,
    sum(Account_Number is null) As Account_Number_null,
    sum(Account_Type is null) As Account_Type_Null,
    sum(Branch_ID is null ) as Branch_ID_Null,
    sum(Opening_Date is null) as Opening_Date_null,
    sum(Balance is null) as Balance_Null,
    sum(Account_Status is null) As Account_Status_Null
from accounts_raw;
select 
	sum(Branch_ID is null) as Branch_ID_Null,
    sum(Branch_Name is null) as Branch_Name_null,
    sum(City is null) as City_null,
    sum(State is null) As State_Null,
    sum(IFSC_Code is null) as Ifsc_code_null,
    sum(Branch_Manager is null) as Branch_Manager_null,
    sum(Address is null) as Address_Null
from branches_raw;
select 
	sum(Card_ID is null) as Card_ID_null,
    sum(Customer_ID is null) as Customer_ID_Null,
    sum(Account_ID is null) as Account_ID_null,
    sum(Card_Type is null) as Card_Type_null,
    sum(Card_Last_6 is null) as Card_Last_null,
    sum(Issue_Date is null) as Issue_Date_Null,
    sum(Expiry_Date is null) as Expiry_Date_Null,
    sum(Card_Status is null) as Card_Status_Null
from cards_raw;
select 
	sum(Customer_ID is null) as Customer_ID_Null,
    sum(Customer_Name is null) as Customer_Name_null,
    sum(Gender is null) as Gender_null,
    sum(Date_of_Birth is null) as DOB_Null,
    sum(Phone is null) as Phone_Null,
    sum(Email is null) as Email_Null,
    sum(Address is null) as Address_Null,
    sum(City is null) as City_Null,
    sum(State is null) as State_Null,
    sum(Country is null) as Country_Null
from customers_raw;
select 
	sum(Employee_ID is null) as Emp_null,
	sum(Employee_Name is null) as Emp_Name_Null,
    sum(Branch_ID is null ) as Branch_null,
    sum(Designation is null) as Designation_Null,
    sum(Department is null) as Dpt_Null,
    sum(Joining_Date is null) as Join_Date_Null,
    sum(Salary is null) as Salary_null,
    sum(Employee_Status is null) as Emp_Status_null
from employees_raw;
select 
	sum(Loan_ID is null) as Loan_ID_Null,
    sum(Customer_ID is null) as Customer_Id_null,
    sum(Account_ID is  null) as Account_Id_NUll,
    sum(Loan_Type is null) as Loan_Type_null,
    sum(Loan_Amount is null) as Loan_Amount_null,
    sum(Interest_Rate is null) as Interest_Rate_null,
    sum(Tenure_Months is null) as Tenure_Months_null,
    sum(Loan_Status is null) as Loan_Status_null,
    sum(Loan_Date is null) as Loan_Date_null
from loans_raw;

select count(*) from transactions_raw 
where Transaction_ID = 'null' or
Account_ID = 'null' or
Customer_ID = 'null' or
Transaction_Date = 'null' or 
Transaction_Type = 'null' or 
`Channel` = 'null' or
Amount = 'null' or 
Balance_After_Transaction = 'null' or
Transaction_Status = 'null' or 
Branch_ID = 'null';

--- 4. check the blank values
select 
	sum(trim(Account_ID) = '') as Account_ID_blank,
    sum(trim(Customer_ID) ='') as Customer_ID_Blank,
    sum(trim(Account_Number)='') As Account_Number_Blank,
    sum(trim(Account_Type) ='') As Account_Type_Blank,
    sum(trim(Branch_ID) = '') as Branch_ID_Blank,
    sum(trim(Opening_Date)= '') as Opening_Date_Blank,
    sum(trim(Balance)='') as Balance_Blank,
    sum(trim(Account_Status) ='') As Account_Status_Blank
from accounts_raw;
select 
	sum(trim(Branch_ID) ='') as Branch_ID_Blank,
    sum(trim(Branch_Name) ='') as Branch_Name_Blank,
    sum(trim(City) ='') as City_Blank,
    sum(trim(State) ='') As State_Blank,
    sum(trim(IFSC_Code) ='') as Ifsc_code_Blank,
    sum(trim(Branch_Manager) ='') as Branch_Manager_Blank,
    sum(trim(Address) ='') as Address_Blank
from branches_raw;
select 
	sum(trim(Card_ID)='') as Card_ID_Blank,
    sum(trim(Customer_ID) ='') as Customer_ID_Blank,
    sum(trim(Account_ID) ='') as Account_ID_Blank,
    sum(trim(Card_Type) ='') as Card_Type_Blank,
    sum(trim(Card_Last_6)='') as Card_Last_Blank,
    sum(trim(Issue_Date)='') as Issue_Date_Blank,
    sum(trim(Expiry_Date)='') as Expiry_Date_Blank,
    sum(trim(Card_Status)='') as Card_Status_Blank
from cards_raw;
select 
	sum(trim(Customer_ID)='') as Customer_ID_Blank,
    sum(trim(Customer_Name) ='') as Customer_Name_Blank,
    sum(trim(Gender)='') as Gender_Blank,
    sum(trim(Date_of_Birth)='') as DOB_Blank,
    sum(trim(Phone) ='') as Phone_Blank,
    sum(trim(Email) ='') as Email_Blank,
    sum(trim(Address) ='') as Address_Blank,
    sum(trim(City) ='') as City_Blank,
    sum(trim(State) ='') as State_Blank,
    sum(trim(Country) ='') as Country_Blank
from customers_raw;
select 
	sum(trim(Employee_ID) ='') as Emp_Blank,
	sum(trim(Employee_Name) ='') as Emp_Name_Blank,
    sum(trim(Branch_ID) ='') as Branch_Blank,
    sum(trim(Designation)='') as Designation_Blank,
    sum(trim(Department) ='') as Dpt_Blank,
    sum(trim(Joining_Date) ='') as Join_Date_Blank,
    sum(trim(Salary) ='') as Salary_Blank,
    sum(trim(Employee_Status) ='') as Emp_Status_Blank
from employees_raw;
select 
	sum(trim(Loan_ID) ='') as Loan_ID_Blank,
    sum(trim(Customer_ID) ='') as Customer_Id_Blank,
    sum(trim(Account_ID) ='') as Account_Id_Blank,
    sum(trim(Loan_Type) ='') as Loan_Type_Blank,
    sum(trim(Loan_Amount) ='') as Loan_Amount_Blank,
    sum(trim(Interest_Rate) ='') as Interest_Rate_Blank,
    sum(trim(Tenure_Months) ='') as Tenure_Months_Blank,
    sum(trim(Loan_Status) ='') as Loan_Status_Blank,
    sum(trim(Loan_Date) ='') as Loan_Date_Blank
from loans_raw;
select 
	sum(trim(Transaction_ID) = '') as Trx_ID_Blank,
    sum(trim(Account_ID) ='') as Acc_ID_Blank,
    sum(trim(Customer_ID)='') as Customer_ID_Blank,
    sum(trim(Transaction_Type) ='') as Trx_Typ_Blank,
    sum(trim(Transaction_Date) ='') as Trx_Date_Blank,
    sum(trim(`Channel`)='') as Channel_Blank,
    sum(trim(Amount) = '') as Amount_blank,
    sum(trim(Balance_After_Transaction) = '') as Balance_After_Transaction_Blank,
    sum(trim(Transaction_Status) = '') as Transaction_Status_Blank,
    sum(trim(Branch_ID) = '') as Branch_ID_Blank
from banking.transactions_raw;

--- 5. duplicate Values check ---

select Account_ID,count(*) as duplicate_count from accounts_raw
group by Account_ID having count(*)>1;
select Card_ID, count(*) as Duplicate_Card from cards_raw 
group by Card_ID having count(*)>1 ;
select Customer_ID, count(*) as Duplicate_Customer from customers_raw
group by Customer_ID having count(*)>1;
select Loan_ID, count(*) as Duplicate_Loan from loans_raw
group by Loan_ID having count(*)>1;
select Transaction_ID,count(*) as Duplicate_Trx from transactions_raw
group by Transaction_ID having count(*)>1;

--- 6. specific column check ---

select Gender,count(*) as total from customers_raw
group by Gender order by total desc;
select Account_Type, count(*) as total from accounts_raw
group by Account_Type order by total desc;
select Transaction_Type , count(*) as total from transactions_raw
group by Transaction_Type order by total desc;
select Channel,count(*) as total from transactions_raw
group by Channel order by total desc;

--- 7. Invalid Transaction amount check ---
select count(*) as Invalid_Transaction from transactions_raw where Amount<0;
select * from transactions_raw where Amount<0;

--- 8. ZERO Transaction Amount check ---
select count(*) as Total_Zero_Transaction from transactions_raw where Amount =0;

--- 9. Check Invalid Balance In account ---
select count(*) as Negative_Balance from accounts_raw where Balance<0;
select * from accounts_raw where Balance<0;

--- 10. Check Invalid Age ---
select 
	Customer_ID,Customer_Name, Date_of_Birth
from customers_raw where Date_of_Birth > curdate();

--------------------------------------------------------------------------------------------------------------------

--- checking the relational  ---

--- 1. Account	to Customer 
select A.Account_ID,A.Customer_ID from accounts_raw A
left join
customers_raw  C
on A.Customer_ID = C.Customer_ID where C.Customer_ID is null;

--- 2. Account to Branches
select a.Account_ID,a.Branch_ID from accounts_raw a
left join
branches_raw b
on a.Branch_ID = b.Branch_ID where b.Branch_ID is null;

--- 3. Transaction to Account ---
select t.Transaction_ID, t.Account_ID from transactions_raw t
left join
accounts_raw a
on t.Account_ID = a.Account_ID where a.Account_ID is null;

--- 4. Loan to Customers ---
select L.Loan_ID,L.Customer_ID from loans_raw L
left join
customers_raw C
on L.Customer_ID = C.Customer_ID where C.Customer_ID is null;

--------------------------------------------------------------------

-------------- Make New Tables AS Clean Tables -----------------

 create database banking_clean;
 
 --- 1. Clean Account Table----
 create table banking_clean.account_clean as
 select 
	 trim(Account_ID) as Account_ID,
     trim(Customer_ID) as Customer_ID,
     trim(Account_Number) as Account_Number,
     case
		when Account_Type is null or trim(Account_Type)='' then 'Unknown'
        else Concat(upper(left(trim(Account_Type),1)),
        lower(Substring(trim(Account_Type),2)))
	end as Account_type,
	trim(Branch_ID) as Branch_ID,
	case
		when Opening_Date is null or trim(Opening_Date) ='' then null
        Else str_to_date(opening_Date,'%Y-%m-%d')
	end as Opening_Date,
    case
		when Balance is null  or Balance = '' then 0
        when Balance < 0 then 0
        else Balance 
	end as Balance,
    Case
		when Account_Status is null or trim(replace(replace(Account_Status, '\r', ''),'\n','')) = '' then 'Unknown'
        when lower(trim(replace(replace(Account_Status, '\r', ''),'\n','')))  = 'active' then 'Active'
        when lower(trim(replace(replace(Account_Status, '\r', ''),'\n',''))) = 'inactive' then 'Inactive'
        when lower(trim(replace(replace(Account_Status, '\r', ''),'\n',''))) = 'dormant' then 'Dormant'
        when lower(trim(replace(replace(Account_Status, '\r', ''),'\n',''))) = 'closed' then 'Closed'
        else 'Unknown'
	End as Account_Status
from accounts_raw ;


--- 2. Cleaning Branches_raw Table --------

create table banking_clean.branches_Clean as
select 
	trim(Branch_ID) as Branch_ID,
    trim(Branch_Name) as Branch_Name,
    trim(City) as City,
    trim(State) as State,
    trim(IFSC_Code) as IFSC_Code,
	case
		when Branch_Manager is null or trim(Branch_Manager) = '' then 'Unknown'
        else trim(Branch_Manager)
	end as Branch_Manager,
    trim(Address) as Address
from branches_raw;


--- 3. clean Card Table ---------

create table banking_clean.cards_clean as
select
	trim(Card_ID) as Card_ID,
    trim(Customer_ID) as Customer_ID,
    trim(Account_ID) as Account_ID,
    case
		when Card_Type is null or trim(Card_Type) = '' then 'Unknown'
        else concat(upper(left(trim(Card_Type),1)),
        lower(substring(trim(Card_Type),2)))
	end as Card_Type,
    trim(Card_Last_6) as Card_Last_6,
    case
		when Issue_Date is null or Trim(Issue_Date) = '' then 'null'
        else str_to_date(Issue_Date,'%Y-%m-%d')
	end as Issue_Date,
    case
		when Expiry_Date is null or trim(Expiry_Date) ='' then 'null'
        else str_to_date(Issue_Date,'%Y-%m-%d')
	end as Expiry_Date,
    case
		when Card_Status is null or trim(Card_Status) = '' then 'Unknown'
        when lower(trim(Card_Status)) = 'active' then 'Active'
        when lower(trim(Card_Status)) = 'inactive' then 'Inactive'
        when lower(trim(Card_Status)) = 'closed' then 'Closed'
        when lower(trim(Card_Status)) = 'dormant' then 'Dormant'
		else 'Unknown'
	end as Card_Status
from cards_raw;

--- 4. clean customer table ---------

create table banking_clean.customers_clean as
select
	trim(Customer_ID) as Customer_ID,
    trim(Customer_Name) as Customer_Name,
    case
		when Gender is null or trim(Gender) = '' then 'Unknown'
        else trim(Gender)
	end as Gender,
    case
		when Date_of_Birth is null or trim(Date_of_Birth) = '' then 'null'
        when trim(Date_of_Birth) regexp '^[0,9]{4}-[0,9]{2}-[0,9]{2}$' then str_to_date(Date_of_Birth,'%Y-%m-%d')
        else 'null'
	end as Date_of_Birth,
    case
		when Phone is null or trim(Phone) = '' then 'null'
        else trim(Phone)
	end as Phone,
    case
		when Email is null or trim(Email) = '' then 'null'
        else lower(trim(Email))
	end as Email,
    Case
		when Address is null or trim(Address) = '' then 'Unknown'
        else trim(Address)
	end as Address,
    case
		when City is null or trim(City) = '' then 'Unknown'
        else trim(City)
	end as City,
    case
		when State is null or trim(State) = '' then 'Unknown'
        else trim(State)
	end as State,
    Case
		when Country is null or trim(Country) = '' then 'Unknown'
        else trim(Country)
	end as Country
from customers_raw;

--- Remove Duplicate Customers ---
create table banking_clean.customer_final as 
select * from ( select *, row_number() over(partition by Customer_ID order by Customer_ID) as rn from banking_clean.customers_clean)x where rn = 1;
drop table banking_clean.customers_clean;
rename table banking_clean.customer_final to banking_clean.customer_clean;

--- 5. clean employees_raw ------

create table banking_clean.employees_clean as 
select 
	trim(Employee_ID) as Employee_ID,
    trim(Employee_Name) as Employee_Name,
    trim(Branch_ID) Branch_ID,
    case
		when Designation is null or trim(Designation) = '' then 'Unknown'
        else trim(Designation)
	end as Designation,
    case
		when Department is null or trim(Department) = '' then 'Unassigned'
        else trim(Department)
	end as Department,
    case
		when Joining_Date is null or trim(Joining_Date) = '' then 'null'
        else str_to_date(Joining_Date,'%Y-%m-%d')
	end as Joining_Date,
    case
		when Salary is null or salary = '' then 0
        when Salary <0 then abs(Salary)
        else Salary
	end as Salary,
    case
		when Employee_Status is null or trim(Employee_Status) = '' then 'Unknown'
         when lower(trim(Employee_Status)) = 'active' then 'Active'
         when lower(trim(Employee_Status)) = 'inactive' then 'Inactive'
         else 'Unknown'        
	end as Employee_Status
from employees_raw;

---  6. cleaning table loan_raw -------

create table banking_clean.loans_clean as
select 
	trim(Loan_ID) as Loan_ID,
    trim(Customer_ID) as Customer_ID,
    trim(Account_ID) as Account_ID,
    Case
		when Loan_Type is null or trim(Loan_Type) = '' then 'Unassigned'
        when lower(trim(Loan_Type)) = 'car loan' then 'Car Loan'
        when lower(trim(Loan_Type)) = 'personal loan' then 'Personal Loan'
        when lower(trim(Loan_Type)) = 'education loan' then 'Education Loan'
        when lower(trim(Loan_type)) = 'home loan' then 'Home Loan'
        when lower(trim(Loan_Type)) = 'business loan' then 'Business Loan'
        else 'Unassigned'
	end as Loan_Type,
    case
		when Loan_Amount is null or trim(Loan_Amount) = '' then null
        when Loan_Amount < 0 then abs(Loan_Amount)
        else Loan_Amount
	end as Loan_Amount,
    case
		when Interest_Rate is null or trim(Interest_Rate) = '' then 0
        when Interest_Rate < 0 then 0
        else Interest_Rate
	end as Interest_Rate,
    Case
		when Tenure_Months is null or trim(Tenure_Months) = '' then 0
        when Tenure_Months < 0 then 0
        else Tenure_Months
	end as Tenure_Months,
    case
		when Loan_Status is null or trim(Loan_Status) = '' then 'Unknown'
        when lower(trim(Loan_Status)) = 'active' then 'Active'
        when lower(trim(Loan_Status)) = 'pending' then 'Pending'
        when lower(trim(Loan_Status)) = 'closed' then 'Closed'
        when lower(trim(Loan_Status)) = 'defaulted' then 'Defaulted'
        else 'Unknown'
	end as Loan_Status,
    case
		when Loan_Date is null or trim(Loan_Date) = '' then null
        else str_to_date(Loan_Date,'%Y-%m-%d')
	end as Loan_Date
from loans_raw;

--- 7.cleaning transactions table -----

create table banking_clean.transaction_clean as
select 
	trim(Transaction_ID) as Transaction_ID,
    trim(Account_ID) as Account_ID,
    trim(Customer_ID) as Customer_ID,
    case
		when Transaction_Date is null or trim(Transaction_Date) = '' then null
        when trim(Transaction_Date) regexp '^[0-9]{4}-[0-9]{2}-[0-9]{2}'
        then str_to_date(trim(Transaction_Date),'%Y-%m-%d')
        when trim(Transaction_Date) regexp '^[0-9]{2}-[0-9]{2}-[0-9]{4}'
        then str_to_date(trim(Transaction_Date),'%m-%d-%Y')
        else null
	end as Transaction_Date,
    case
		when Transaction_Type is null or trim(Transaction_Type) = '' then 'Unknown'
        else concat(upper(left(trim(Transaction_type),1)),
        lower(substring(trim(Transaction_type),2)))
	end as Transaction_Type,
	case
		when Channel is null or trim(Channel) = '' then 'Unknown'
        else trim(Channel)
	end as Channel,
    Case
		when Amount is null or trim(Amount) = '' then 0
        when Amount < 0 then abs(Amount)
        else Amount
	end as Amount,
    case
		when Balance_After_Transaction is null or trim(Balance_After_Transaction) = '' then 0
        when Balance_After_Transaction < 0 then 0
        else Balance_After_Transaction
	end as Balance_After_Transaction,
    case
		when Transaction_Status is null or trim(Transaction_Status) = '' then 'Unknown'
        when lower(trim(Transaction_Status)) = 'success' then'Success'
        when lower(trim(Transaction_Status)) = 'failed' then 'Failed'
        when lower(trim(Transaction_Status)) = 'pending' then 'Pending'
        when lower(trim(Transaction_Status)) = 'reversed' then 'Reversed'
        else 'Unknown'
	end as Transaction_Status,
    trim(Branch_ID) as Branch_ID
from transactions_raw;
