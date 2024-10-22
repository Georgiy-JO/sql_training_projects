# D01 SQL - "_First steps working with sets and JOINs in SQL_"

## Theory

![D01_01](../misc/images/D01_01.png)

In many aspects, sets are used in Relational Databases. Not only to do UNION or MINUS between sets. Sets are also good candidates for doing recursive queries.

There are the following set operators in PostgreSQL:
- UNION [ALL]
- EXCEPT [ALL] 
- INTERSECT [ALL]

The keyword "ALL" means to store duplicate rows in the result.
The main rules for working with sets are as follows:
- Main SQL provides final names of attributes for the whole query.
- The attributes of controlled SQL should match the number of columns and corresponding family types of main SQL.

![D01_02](../misc/images/D01_02.png)

In addition, SQL sets are useful for calculating some specific data science metrics, such as the Jaccard distance between 2 objects based on existing data features.


## Rules of the day
|Check|Point|
|---|---|
|✔|Please make sure you have your own database and access to it on your PostgreSQL cluster. |
|✔|Please download a [script](../materials/model.sql) with Database Model here and apply the script to your database (you can use command line with psql or just run it through any IDE, for example DataGrip from JetBrains or pgAdmin from PostgreSQL community). |
|✔|All tasks contain a list of Allowed and Denied sections with listed database options, database types, SQL constructions etc. Please have a look at the section before you start.|
|✔|Please take a look at the Logical View of our Database Model. |

## DB Structure

![schema](../misc/images/schema.png)
|Table|Columns|
|---|---|
|**pizzeria** table (Dictionary Table with available pizzerias)|id — primary key <br>name — name of pizzeria <br>rating — average rating of pizzeria (from 0 to 5 points)|
|**person** table (Dictionary Table with persons who loves pizza)|id — primary key <br>name — name of person <br>age — age of person <br>gender — gender of person <br>address — address of person|
|**menu** table (Dictionary Table with available menu and price for concrete pizza)|id — primary key <br>pizzeria_id — foreign key to pizzeria <br>pizza_name — name of pizza in pizzeria <br>price — price of concrete pizza|
|**person_visits** table (Operational Table with information about visits of pizzeria)|id — primary key <br>person_id — foreign key to person <br>pizzeria_id — foreign key to pizzeria <br>visit_date — date (for example 2022-01-01) of person visit |
|**person_order** table (Operational Table with information about persons orders)|id — primary key <br>person_id — foreign key to person <br>menu_id — foreign key to menu <br>order_date — date (for example 2022-01-01) of person order |

* People's visit and people's order are different entities and don't contain any correlation between data. For example, a customer can be in a restaurant (just looking at the menu) and in that time place an order in another restaurant by phone or mobile application. Or another case, just be at home and again make a call with order without any visits.


## Practice tasks
|Check|Point|
|---|---|
|✔|Exercise 00|
|✔|Exercise 01|
|✔|Exercise 02|
|✔|Exercise 03|
|✔|Exercise 04|
|✔|Exercise 05|
|✔|Exercise 06|
|✔|Exercise 07|
|✔|Exercise 08|
|✔|Exercise 09|
|✔|Exercise 10|


### Exercise 00 — Let’s make UNION dance

| Exercise 00: Let’s make UNION dance ||
|---|---|
| Turn-in directory| ex00|
| Files to turn-in | `day01_ex00.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please write a SQL statement that returns the **menu identifier** and **pizza names** from the `menu` table and the **person identifier** and **person name** from the `person` table in one global list (with column names as shown in the example below) ordered by **object_id** and then by **object_name** columns.

| object_id | object_name |
| ------ | ------ |
| 1 | Anna |
| 1 | cheese pizza |
| ... | ... |


### Exercise 01 — UNION dance with subquery

| Exercise 01: UNION dance with subquery||
|---|---|
| Turn-in directory| ex01|
| Files to turn-in | `day01_ex01.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please modify an SQL statement from "Exercise 00" by **removing the object_id** column. Then change the order by object_name for part of the **data from the `person` table** and **then from the `menu` table** (as shown in an example below). Please **save duplicates**!

| object_name |
| ------ |
| Andrey |
| Anna |
| ... |
| cheese pizza |
| cheese pizza |
| ... |


### Exercise 02 — Duplicates or not duplicates

| Exercise 02: Duplicates or not duplicates||
|---|---|
| Turn-in directory| ex02|
| Files to turn-in | `day01_ex02.sql` |
| **Allowed** ||
| Language| ANSI SQL |
| **Denied** ||
| SQL Syntax Construction| `DISTINCT`, `GROUP BY`, `HAVING`, any type of `JOINs` |
 
Write an SQL statement that returns **unique pizza names** from the `menu` table and **sorts them by the pizza_name** column in **descending** order. Please note the Denied section.


### Exercise 03 — “Hidden” Insights

| Exercise 03: “Hidden” Insights ||
|---|---|
| Turn-in directory| ex03|
| Files to turn-in | `day01_ex03.sql` |
| **Allowed** ||
| Language| ANSI SQL |
| **Denied** ||
| SQL Syntax Construction|  any type of `JOINs` |

Write an SQL statement that returns common rows for attributes **order_date**, **person_id** from the **`person_order`** table on one side and **visit_date**, **person_id** from the **`person_visits`** table on the other side (see an example below). In other words, let's find the identifiers of persons who visited and ordered a pizza on the same day. Actually, please add the **order by action_date in ascending** mode and then **by person_id in descending** mode.

| action_date | person_id |
| ------ | ------ |
| 2022-01-01 | 6 |
| 2022-01-01 | 2 |
| 2022-01-01 | 1 |
| 2022-01-03 | 7 |
| 2022-01-04 | 3 |
| ... | ... |


### Exercise 04 — Difference? Yep, let's find the difference between multisets.

| Exercise 04: Difference? Yep, let's find the difference between multisets. ||
|---|---|
| Turn-in directory| ex04|
| Files to turn-in | `day01_ex04.sql` |
| **Allowed** ||
| Language| ANSI SQL |
| **Denied** ||
| SQL Syntax Construction|  any type of `JOINs` |

Please write a SQL statement that returns a difference (minus) of person_id column values while saving duplicates between `person_order` table and `person_visits` table for order_date and visit_date are for January 7, 2022.


### Exercise 05 — Did you hear about Cartesian Product?

| Exercise 05: Did you hear about Cartesian Product? ||
|---|---|
| Turn-in directory| ex05|
| Files to turn-in | `day01_ex05.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please write a SQL statement that returns all possible combinations between `person` and `pizzeria` tables, and please set the order of the person identifier columns and then the pizzeria identifier columns. Please take a look at the sample result below. Please note that the column names may be different for you.

| person.id | person.name | age | gender | address | pizzeria.id | pizzeria.name | rating |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| 1 | Anna | 16 | female | Moscow | 1 | Pizza Hut | 4.6 |
| 1 | Anna | 16 | female | Moscow | 2 | Dominos | 4.3 |
| ... | ... | ... | ... | ... | ... | ... | ... |


### Exercise 06 — Lets see on “Hidden” Insights

| Exercise 06: Lets see on “Hidden” Insights ||
|---|---|
| Turn-in directory| ex06|
| Files to turn-in | `day01_ex06.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Let's go back to Exercise #03 and modify our SQL statement to return **person names instead of person identifiers** and change the order by **action_date in ascending** mode and then by **person_name in descending** mode. Take a look at the sample data below.

| action_date | person_name |
| ------ | ------ |
| 2022-01-01 | Irina |
| 2022-01-01 | Anna |
| 2022-01-01 | Andrey |
| ... | ... |


### Exercise 07 — Just make a JOIN

| Exercise 07: Just make a JOIN ||
|---|---|
| Turn-in directory| ex07|
| Files to turn-in | `day01_ex07.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Write an SQL statement that returns the **order date** from the `person_order` table and the corresponding **person name** (name and age are formatted as in the data sample below) who made an order from the `person` table. Add a sort by **both columns in ascending** order.

| order_date | person_information |
| ------ | ------ |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Anna (age:16) |
| ... | ... |


### Exercise 08 — Migrate JOIN to NATURAL JOIN

| Exercise 08: Migrate JOIN to NATURAL JOIN ||
|---|---|
| Turn-in directory| ex08|
| Files to turn-in | `day01_ex08.sql` |
| **Allowed** ||
| Language| ANSI SQL |
| SQL Syntax Construction| `NATURAL JOIN` |
| **Denied** ||
| SQL Syntax Construction| other type of  `JOINs` |

Please rewrite a SQL statement from Exercise #07 by using **NATURAL JOIN** construction. The result must be the same like for Exercise #07.  


### Exercise 09 — IN versus EXISTS

| Exercise 09: IN versus EXISTS ||
|---|---|
| Turn-in directory| ex09|
| Files to turn-in | `day01_ex09.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Write 2 SQL statements that return a list of pizzerias that have not been visited by people using IN for the first and EXISTS for the second.


### Exercise 10 — Global JOIN

| Exercise 10: Global JOIN ||
|---|---|
| Turn-in directory| ex10|
| Files to turn-in | `day01_ex10.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please write an SQL statement that returns a list of the names of the people who ordered pizza from the corresponding pizzeria. 
The sample result (with named columns) is provided below and yes ... please make the ordering by 3 columns (`person_name`, `pizza_name`, `pizzeria_name`) in ascending mode.

| person_name | pizza_name | pizzeria_name | 
| ------ | ------ | ------ |
| Andrey | cheese pizza | Dominos |
| Andrey | mushroom pizza | Dominos |
| Anna | cheese pizza | Pizza Hut |
| ... | ... | ... |

