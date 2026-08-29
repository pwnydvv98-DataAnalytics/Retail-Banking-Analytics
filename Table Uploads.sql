set global local_infile = 1;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/accounts_raw.csv"
into table banking.accounts_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
truncate table banking.branches_raw;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/branches_raw.csv"
into table banking.branches_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cards_raw.csv"
into table banking.cards_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers_raw.csv"
into table banking.customers_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows ;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employees_raw.csv"
into table banking.employees_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows ;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/loans_raw.csv"
into table banking.loans_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows ;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/transactions_raw.csv"
into table banking.transactions_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows ;