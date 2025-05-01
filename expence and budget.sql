-- create database
create database project;
-- use database s1
use project;
-- create user table
create table User
   ( user_id int primary key,
    name varchar(45) not null,
    email varchar(45) unique,
    password varchar(45) not null
);
-- show the table 
select*from user; 
-- create account_table table
create table account
(account_id int primary key,
user_id int not null,
account_name varchar(45) not null,
account_type varchar(45) not null,
balance decimal(10,2) check (balance>=0),
constraint fk_account_user foreign key(user_id)references user(user_id) on delete cascade on update cascade);
-- show the table
select*from account;
desc account;
-- create a budget table
create table budget
(budget_id int primary key,
user_id int not null,
category varchar(45) not null,
limit_amount decimal(10,2) check (limit_amount>50),
start_date date not null,
end_date date not null,
check (start_date < end_date),
constraint fk_budget_user foreign key (user_id) references user(user_id)on delete cascade on update cascade);
-- show budget table
select* from budget;
-- create a category table
create table category 
(category_id int primary key,
name varchar(45) not null,
type varchar(45) not null check(type in ("income","expense")));
-- shoe category table
select* from category;
-- create a expence table
create table expense
(expense_id int primary key,
user_id int not null,
account_id int not null,
budget_id int not null,
category_id int not null,
amount decimal(10,2) not null check(amount> 50),
description varchar(45),
expense_date date,
constraint fk_expense_user foreign key (user_id) references user(user_id)on delete cascade on update cascade ,
constraint fk_expense_account foreign key (account_id) references account(account_id)on delete cascade on update cascade,
constraint fk_expense_budget foreign key (budget_id) references budget(budget_id)on delete cascade on update cascade,
constraint fk_expense_category foreign key (category_id) references category(category_id)on delete cascade on update cascade);
-- show the expense table
select* from expense;
-- create a income table
create table income
(income_id int primary key,
user_id int not null,
account_id int not null,
category_id int not null,
source varchar(45) not null,
amount decimal(10,2) not null check(amount> 50),
income_date date,
constraint fk_income_user foreign key (user_id) references user(user_id)on delete cascade on update cascade,
constraint fk_income_account foreign key (account_id) references account(account_id)on delete cascade on update cascade,
constraint fk_income_category foreign key (category_id) references category(category_id)on delete cascade on update cascade);
-- show the income table
select * from income;
-- insert the user data
insert into user values
(1, 'Alice Johnson', 'alice.johnson@example.com', 'password123'),
(2, 'Bob Smith', 'bob.smith@example.com', 'password123'),
(3, 'Charlie Davis', 'charlie.davis@example.com', 'password123'),
(4, 'Diana Evans', 'diana.evans@example.com', 'password123'),
(5, 'Ethan Wright', 'ethan.wright@example.com', 'password123'),
(6, 'Fiona Green', 'fiona.green@example.com', 'password123'),
(7, 'George Adams', 'george.adams@example.com', 'password123'),
(8, 'Hannah Carter', 'hannah.carter@example.com', 'password123'),
(9, 'Ian Turner', 'ian.turner@example.com', 'password123'),
(10, 'Julia Hall', 'julia.hall@example.com', 'password123'),
(11, 'Kevin Allen', 'kevin.allen@example.com', 'password123'),
(12, 'Laura Young', 'laura.young@example.com', 'password123'),
(13, 'Mike Scott', 'mike.scott@example.com', 'password123'),
(14, 'Nina Baker', 'nina.baker@example.com', 'password123'),
(15, 'Oscar Perez', 'oscar.perez@example.com', 'password123'),
(16, 'Paula Collins', 'paula.collins@example.com', 'password123'),
(17, 'Quinn Foster', 'quinn.foster@example.com', 'password123'),
(18, 'Rachel Morris', 'rachel.morris@example.com', 'password123'),
(19, 'Sam Lee', 'sam.lee@example.com', 'password123'),
(20, 'Tina Rivera', 'tina.rivera@example.com', 'password123'),
(21, 'Umar Patel', 'umar.patel@example.com', 'password123'),
(22, 'Vera Nelson', 'vera.nelson@example.com', 'password123'),
(23, 'Will Murphy', 'will.murphy@example.com', 'password123'),
(24, 'Xena Stone', 'xena.stone@example.com', 'password123'),
(25, 'Yusuf Grant', 'yusuf.grant@example.com', 'password123'),
(26, 'Zara Boyd', 'zara.boyd@example.com', 'password123'),
(27, 'Ava Brooks', 'ava.brooks@example.com', 'password123'),
(28, 'Ben Matthews', 'ben.matthews@example.com', 'password123'),
(29, 'Clara Simmons', 'clara.simmons@example.com', 'password123'),
(30, 'David Hunt', 'david.hunt@example.com', 'password123');
-- insert the account table data
insert into account values
(1, 1, 'HDFC Bank', 'Bank', 10000.00),
(2, 2, 'Cash Wallet', 'Cash', 2500.00),
(3, 3, 'ICICI Credit Card', 'Credit Card', 5000.00),
(4, 4, 'SBI Bank', 'Bank', 8000.00),
(5, 5, 'Axis Wallet', 'Cash', 3000.00),
(6, 6, 'Kotak Savings', 'Bank', 9200.00),
(7, 7, 'PhonePe', 'Digital Wallet', 450.00),
(8, 8, 'Amazon Pay', 'Digital Wallet', 850.00),
(9, 9, 'Cash', 'Cash', 400.00),
(10, 10, 'Google Pay', 'Digital Wallet', 510.00),
(11, 11, 'PayTM', 'Digital Wallet', 760.00),
(12, 12, 'SBI Credit', 'Credit Card', 11000.00),
(13, 13, 'Bank of Baroda', 'Bank', 13200.00),
(14, 14, 'BOI Wallet', 'Cash', 950.00),
(15, 15, 'Axis Credit', 'Credit Card', 8700.00),
(16, 16, 'Citi Bank', 'Bank', 10900.00),
(17, 17, 'HDFC Wallet', 'Digital Wallet', 650.00),
(18, 18, 'CashX', 'Cash', 320.00),
(19, 19, 'SBI Pay', 'Digital Wallet', 420.00),
(20, 20, 'Federal Bank', 'Bank', 11800.00),
(21, 21, 'RBL Credit', 'Credit Card', 9100.00),
(22, 22, 'WalletPro', 'Cash', 300.00),
(23, 23, 'IndusInd Bank', 'Bank', 7200.00),
(24, 24, 'FreeCharge', 'Digital Wallet', 390.00),
(25, 25, 'Bank Central', 'Bank', 10300.00),
(26, 26, 'YONO Wallet', 'Digital Wallet', 505.00),
(27, 27, 'ICICI Pay', 'Digital Wallet', 785.00),
(28, 28, 'PayZapp', 'Digital Wallet', 605.00),
(29, 29, 'CashPoint', 'Cash', 420.00),
(30, 30, 'Yes Bank', 'Bank', 11200.00);
-- insert the budget table datas
insert into budget values
(1, 1, 'Grocery', 5000, '2025-04-01', '2025-04-30'),
(2, 2, 'Utilities', 3000, '2025-04-01', '2025-04-30'),
(3, 3, 'Dining', 4000, '2025-04-01', '2025-04-30'),
(4, 4, 'Shopping', 7000, '2025-04-01', '2025-04-30'),
(5, 5, 'Fuel', 2500, '2025-04-01', '2025-04-30'),
(6, 6, 'Internet', 1000, '2025-04-01', '2025-04-30'),
(7, 7, 'Medical', 2000, '2025-04-01', '2025-04-30'),
(8, 8, 'Insurance', 2500, '2025-04-01', '2025-04-30'),
(9, 9, 'Entertainment', 1500, '2025-04-01', '2025-04-30'),
(10, 10, 'Loan EMI', 6000, '2025-04-01', '2025-04-30'),
(11, 11, 'Recharge', 800, '2025-04-01', '2025-04-30'),
(12, 12, 'Education', 3000, '2025-04-01', '2025-04-30'),
(13, 13, 'Clothing', 2500, '2025-04-01', '2025-04-30'),
(14, 14, 'Charity', 1000, '2025-04-01', '2025-04-30'),
(15, 15, 'Gifts', 1200, '2025-04-01', '2025-04-30'),
(16, 16, 'Maintenance', 1800, '2025-04-01', '2025-04-30'),
(17, 17, 'Subscriptions', 1000, '2025-04-01', '2025-04-30'),
(18, 18, 'Travel', 4000, '2025-04-01', '2025-04-30'),
(19, 19, 'Pet Care', 1200, '2025-04-01', '2025-04-30'),
(20, 20, 'Groceries', 5000, '2025-04-01', '2025-04-30'),
(21, 21, 'Online Shopping', 7000, '2025-04-01', '2025-04-30'),
(22, 22, 'Internet', 1500, '2025-04-01', '2025-04-30'),
(23, 23, 'Insurance', 3000, '2025-04-01', '2025-04-30'),
(24, 24, 'Entertainment', 2000, '2025-04-01', '2025-04-30'),
(25, 25, 'Gas', 2500, '2025-04-01', '2025-04-30'),
(26, 26, 'Dining', 3500, '2025-04-01', '2025-04-30'),
(27, 27, 'Fuel', 2700, '2025-04-01', '2025-04-30'),
(28, 28, 'Loan', 6500, '2025-04-01', '2025-04-30'),
(29, 29, 'Work Tools', 2000, '2025-04-01', '2025-04-30'),
(30, 30, 'Health', 2200, '2025-04-01', '2025-04-30');
-- insert the category table datas
insert into category values
(1, 'Salary', 'income'),
(2, 'Freelance', 'income'),
(3, 'Consulting', 'income'),
(4, 'Rent Income', 'income'),
(5, 'Dividends', 'income'),
(6, 'Grocery', 'expense'),
(7, 'Utilities', 'expense'),
(8, 'Dining', 'expense'),
(9, 'Shopping', 'expense'),
(10, 'Fuel', 'expense'),
(11, 'Internet', 'expense'),
(12, 'Medical', 'expense'),
(13, 'Insurance', 'expense'),
(14, 'Entertainment', 'expense'),
(15, 'Loan EMI', 'expense'),
(16, 'Bonus', 'income'),
(17, 'Savings Interest', 'income'),
(18, 'Tutoring', 'income'),
(19, 'Commission', 'income'),
(20, 'Side Hustle', 'income'),
(21, 'Investments', 'income'),
(22, 'Recharge', 'expense'),
(23, 'Education', 'expense'),
(24, 'Clothing', 'expense'),
(25, 'Charity', 'expense'),
(26, 'Gift', 'expense'),
(27, 'Maintenance', 'expense'),
(28, 'Subscriptions', 'expense'),
(29, 'Travel', 'expense'),
(30, 'Pet Care', 'expense');
-- insert the expense table datas
insert into expense values
(1, 1, 1, 1, 6, 1200, 'Groceries', '2025-04-01'),
(2, 2, 2, 2, 7, 500, 'Electricity Bill', '2025-04-02'),
(3, 3, 3, 3, 8, 1500, 'Dinner Out', '2025-04-03'),
(4, 4, 4, 4, 9, 3000, 'New Shoes', '2025-04-04'),
(5, 5, 5, 5, 10, 800, 'Petrol', '2025-04-05'),
(6, 6, 6, 6, 11, 600, 'Internet', '2025-04-06'),
(7, 7, 7, 7, 12, 900, 'Pharmacy', '2025-04-06'),
(8, 8, 8, 8, 13, 1200, 'Insurance Premium', '2025-04-07'),
(9, 9, 9, 9, 14, 1100, 'Movies and Snacks', '2025-04-08'),
(10, 10, 10, 10, 15, 5000, 'Loan EMI', '2025-04-08'),
(11, 11, 11, 11, 22, 300, 'Mobile Recharge', '2025-04-09'),
(12, 12, 12, 12, 23, 2000, 'Online Course', '2025-04-09'),
(13, 13, 13, 13, 24, 1800, 'Clothes', '2025-04-10'),
(14, 14, 14, 14, 25, 600, 'Charity Donation', '2025-04-11'),
(15, 15, 15, 15, 26, 700, 'Birthday Gift', '2025-04-11'),
(16, 16, 16, 16, 27, 950, 'AC Maintenance', '2025-04-12'),
(17, 17, 17, 17, 28, 450, 'Netflix', '2025-04-12'),
(18, 18, 18, 18, 29, 3500, 'Trip to Goa', '2025-04-13'),
(19, 19, 19, 19, 30, 400, 'Dog Grooming', '2025-04-14'),
(20, 20, 20, 20, 6, 1100, 'Groceries', '2025-04-14'),
(21, 21, 21, 21, 9, 2200, 'Amazon Order', '2025-04-15'),
(22, 22, 22, 22, 11, 650, 'Internet Bill', '2025-04-16'),
(23, 23, 23, 23, 13, 1700, 'Insurance', '2025-04-16'),
(24, 24, 24, 24, 14, 500, 'Comedy Show', '2025-04-17'),
(25, 25, 25, 25, 7, 750, 'Gas Bill', '2025-04-17'),
(26, 26, 26, 26, 8, 1300, 'Dinner', '2025-04-18'),
(27, 27, 27, 27, 10, 600, 'Fuel', '2025-04-19'),
(28, 28, 28, 28, 15, 4800, 'Loan Payment', '2025-04-19'),
(29, 29, 29, 29, 20, 1700, 'Side Hustle Tools', '2025-04-20'),
(30, 30, 30, 30, 12, 1000, 'Medicines', '2025-04-20');
-- insert the income table datas
insert into income values
(1, 1, 1, 1, 'Salary', 50000, '2025-04-01'),
(2, 2, 2, 1, 'Salary', 45000, '2025-04-01'),
(3, 3, 3, 2, 'Freelance Work', 15000, '2025-04-02'),
(4, 4, 4, 3, 'Consulting Fees', 20000, '2025-04-03'),
(5, 5, 5, 4, 'Rent from Apartment', 10000, '2025-04-04'),
(6, 6, 6, 16, 'Bonus', 5000, '2025-04-04'),
(7, 7, 7, 17, 'Savings Interest', 600, '2025-04-05'),
(8, 8, 8, 5, 'Dividends', 700, '2025-04-06'),
(9, 9, 9, 18, 'Tutoring', 900, '2025-04-06'),
(10, 10, 10, 19, 'Commission', 1500, '2025-04-07'),
(11, 11, 11, 20, 'Side Hustle', 2000, '2025-04-08'),
(12, 12, 12, 21, 'Stock Returns', 3000, '2025-04-08'),
(13, 13, 13, 1, 'Salary', 55000, '2025-04-09'),
(14, 14, 14, 1, 'Salary', 48000, '2025-04-09'),
(15, 15, 15, 1, 'Salary', 47000, '2025-04-10'),
(16, 16, 16, 2, 'Freelancing', 13000, '2025-04-11'),
(17, 17, 17, 3, 'Consulting Fees', 11000, '2025-04-12'),
(18, 18, 18, 4, 'Rent', 8000, '2025-04-12'),
(19, 19, 19, 5, 'Dividends', 600, '2025-04-13'),
(20, 20, 20, 17, 'Savings Interest', 450, '2025-04-14'),
(21, 21, 21, 16, 'Bonus', 7000, '2025-04-14'),
(22, 22, 22, 18, 'Tutoring', 1500, '2025-04-15'),
(23, 23, 23, 1, 'Salary', 52000, '2025-04-15'),
(24, 24, 24, 20, 'Side Project', 1900, '2025-04-16'),
(25, 25, 25, 19, 'Commission', 1100, '2025-04-17'),
(26, 26, 26, 5, 'Dividends', 900, '2025-04-17'),
(27, 27, 27, 21, 'Investments', 2000, '2025-04-18'),
(28, 28, 28, 1, 'Salary', 48000, '2025-04-18'),
(29, 29, 29, 2, 'Freelancing', 16000, '2025-04-19'),
(30, 30, 30, 3, 'Consulting', 21000, '2025-04-20');
-- stored procedure for Add New Expense
DELIMITER //
CREATE PROCEDURE Addexpense (
    IN useri_d INT,
    IN category VARCHAR(50),
    IN amount DECIMAL(10,2),
    IN expense_date DATE,
    IN notes TEXT
)
BEGIN
    INSERT INTO expense (user_id, category, amount, date, notes)
    VALUES (user_id, category, amount, expense_date, notes);
END;
//
DELIMITER ;
-- Add New Income Entry STORED PROCEDURE
DELIMITER //
CREATE PROCEDURE Addincome (
    IN user_id INT,
    IN source VARCHAR(100),
    IN amount DECIMAL(10,2),
    IN income_date DATE,
    IN notes TEXT
)
BEGIN
    INSERT INTO Income (user_id, source, amount, date, notes)
    VALUES (user_id, source, amount, income_date, notes);
END;
//
DELIMITER ;
-- Generate Expense Report Between Dates
DELIMITER //
CREATE PROCEDURE expense_report (
    IN user_id INT,
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT 
        date,
        category,
        amount,
        notes
    FROM expense
    WHERE user_id = user_id
      AND date BETWEEN start_date AND end_date
    ORDER BY date ASC;
END;
//
DELIMITER ;
-- Get Income vs Expense Summary for a Month
DELIMITER //
CREATE PROCEDURE incomeVsexpense (
    IN user_id INT,
    IN year INT,
    IN month INT
)
BEGIN
    DECLARE total_income DECIMAL(10,2);
    DECLARE total_expense DECIMAL(10,2);

    SELECT SUM(amount) INTO total_income
    FROM income
    WHERE user_id = user_id AND YEAR(date) = year AND MONTH(date) = month;

    SELECT SUM(amount) INTO total_expense
    FROM Expense
    WHERE user_id = userId AND YEAR(date) = year AND MONTH(date) = month;

    SELECT total_income AS Total_income, 
           total_expense AS Total_expense, 
           (total_income - total_expense) AS Net_Savings;
END;
//
DELIMITER ;
-- List Over-Budget Categories for a Month
DELIMITER //
CREATE PROCEDURE OverBudgetCategories (
    IN user_id INT,
    IN year INT,
    IN month INT
)
BEGIN
    SELECT 
        e.category,
        SUM(e.amount) AS total_spent,
        b.budget_amount
    FROM Expense e
    JOIN Budget b ON e.user_id = b.user_id AND e.category = b.category
    WHERE e.user_id = user_id
      AND YEAR(e.date) = year
      AND MONTH(e.date) = month
    GROUP BY e.category, b.budget_amount
    HAVING total_spent > b.budget_amount;
END;
//
DELIMITER ;
-- Get Today's Expenses for a User
DELIMITER //
CREATE PROCEDURE GetTodaysExpenses (
    IN user_id INT
)
BEGIN
    SELECT *
    FROM expense
    WHERE user_id = user_id AND date = CURDATE();
END;
//
DELIMITER ;
-- Top N Expenses for a Month
DELIMITER //
CREATE PROCEDURE TopExpenses (
    IN user_id INT,
    IN year INT,
    IN month INT,
    IN limit_count INT
)
BEGIN
    SELECT *
    FROM expense
    WHERE user_id = user_id
      AND YEAR(date) = year
      AND MONTH(date) = month
    ORDER BY amount DESC
    LIMIT limit_count;
END;
//
DELIMITER ;
