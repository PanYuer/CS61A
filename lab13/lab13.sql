.read data.sql

-- QUESTIONS --



-------------------------------------------------------------------------
------------------------ Give Interest- ---------------------------------
-------------------------------------------------------------------------

-- replace this line with your solution
UPDATE accounts SET amount = 1.02*amount;


create table give_interest_result as select * from accounts; -- just for tests

-------------------------------------------------------------------------
------------------------ Split Accounts ---------------------------------
-------------------------------------------------------------------------

-- replace this line with your solution
create table two_accounts as
	SELECT name || "'s Savings account" as account_name, 0.5*amount as account_amount
		FROM accounts UNION
	SELECT name || "'s Checking account", 0.5*amount FROM accounts;

DELETE FROM accounts;
INSERT into accounts SELECT account_name, account_amount FROM two_accounts; 

create table split_account_results as select * from accounts; -- just for tests

-------------------------------------------------------------------------
-------------------------------- Whoops ---------------------------------
-------------------------------------------------------------------------

-- replace this line with your solution
DROP TABLE accounts;

CREATE TABLE average_prices AS
  SELECT category as category, avg(MSRP) as average_price
	from products group by category;

CREATE TABLE lowest_prices AS
  SELECT store as store, item as item, price as p from inventory
	group by item having p = min(p);

CREATE TABLE shopping_list(item, store);

CREATE TABLE shopping_list_item AS
  SELECT name as name from products group by category having min(MSRP/rating);

CREATE TABLE shopping_list_store AS
	SELECT store as store, item as item
		from lowest_prices, shopping_list_item where name = item;

insert into shopping_list SELECT name, store
	from shopping_list_item as item, shopping_list_store as store
	where item = name;

CREATE TABLE total_bandwidth AS
  SELECT sum(s.Mbs) from shopping_list as l, stores as s
	where s.store = l.store;
