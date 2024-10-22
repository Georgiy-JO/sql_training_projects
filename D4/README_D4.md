# D04 SQL - _Snapshots, virtual tables… What is going on?_

## Theory

![D04_02](../misc/images/D04_02.png)

Why do we need virtual tables and materialized views in databases? Databases are just tables, aren't they? 
No, not really. Databases are similar to object-oriented languages. Just remember, you have a lot of abstraction in Java (we mean Java interfaces). We need abstraction to achieve "clean architecture" and change objects with minimal impact on dependencies (sometimes it works :-).

Moreover, there is a specific architecture pattern in the Relational Database called ANSI/SPARK.
This pattern divides objects into three levels: 
- external level,
- conceptual level,
- internal level.

Therefore, we can say that Virtual Tables and Materialized Views are physical interfaces between tables with data and user/application.
So, what is the difference between 2 objects? The main difference is the "freshness" of the data. Below you can see the behavior of these objects in graphical representation.

|  |  |
| ------ | ------ |
| View is a continuous object with the same data like in the underlying table(s), that are used to create this view. Other words, if we select data from view, view reroutes our query to underlying objects and then returns results for us. | ![D04_03](../misc/images/D04_03.png) |
| ![D04_04](../misc/images/D04_04.png) | Materialized View is a discrete object. Other words, we need to wait when the Materialized View will be refreshed based on an “event trigger” (for example, time schedule). This object always is behind actual data in underlying tables. |

There are also "a few" additional differences between View and Materialized View.
- Virtual Table can work with `INSERT/UPDATE/DELETE` traffic, but with some restrictions. 
- Virtual Tables can have “Instead Of” Triggers to make a better control of incoming `INSERT/UPDATE/DELETE` traffic.
- Materialized View is ReadOnly object for `INSERT/UPDATE/DELETE` traffic.
- Materialized Views can have user defined indexes on columns to speed up queries.


## Rules of the day

|Check| Condition|
|---|---|
|✔|Please make sure you have your own database and access for it on your PostgreSQL cluster. |
|✔|Please download a [script](../materials/model.sql) with Database Model here and apply the script to your database (you can use command line with psql or just run it through any IDE, for example DataGrip from JetBrains or pgAdmin from PostgreSQL community). **Our knowledge way is incremental and linear therefore please be aware all changes that you made in Day03 during exercises 07-13 should be in place (its similar like in real world , when we applied a release and need to be consistency with data for new changes).**|
|✔|All tasks contain a list of Allowed and Denied sections with listed database options, database types, SQL constructions etc. Please have a look at this section before you start.|
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


## Tasks

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

### Exercise 00 — Let’s create separated views for persons

| Exercise 00: Let’s create separated views for persons ||
|---|---|
| Turn-in directory| ex00 |
| Files to turn-in | `day04_ex00.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please create 2 Database Views (with similar attributes as the original table) based on a simple filtering by gender of persons. Set the corresponding names for the database views: `v_persons_female` and `v_persons_male`.


### Exercise 01 — From parts to common view

| Exercise 01: From parts to common view||
|---|---|
| Turn-in directory| ex01 |
| Files to turn-in | `day04_ex01.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please use 2 Database Views from Exercise #00 and write SQL to get female and male person names in one list. Please specify the order by person name. The sample data is shown below.

| name |
| ------ |
| Andrey |
| Anna |
| ... |


### Exercise 02 — "Store" generated dates in one place

| Exercise 02: "Store" generated dates in one place||
|---|---|
| Turn-in directory| ex02 |
| Files to turn-in | `day04_ex02.sql` |
| **Allowed** ||
| Language| ANSI SQL |
| SQL Syntax Construction| `generate_series(...)` |

Please **create a Database View** (with name `v_generated_dates`) which should "store" generated dates from **January 1st** to **January 31st**, 2022 in type DATE. Don't forget the order of the generated_date column.

| generated_date |
| ------ |
| 2022-01-01 |
| 2022-01-02 |
| ... |


### Exercise 03 — Find missing visit days with Database View

| Exercise 03: Find missing visit days with Database View ||
|---|---|
| Turn-in directory| ex03 |
| Files to turn-in | `day04_ex03.sql` |
| **Allowed** ||
| Language| ANSI SQL |


Write a SQL statement that returns missing days for people's visits in January 2022. Use the `v_generated_dates` view for this task and sort the result by the missing_date column. The sample data is shown below.

| missing_date |
| ------ |
| 2022-01-11 |
| 2022-01-12 |
| ... |


### Exercise 04 — Let’s find something from Set Theory

| Exercise 04: Let’s find something from Set Theory ||
|---|---|
| Turn-in directory| ex04 |
| Files to turn-in | `day04_ex04.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Write an SQL statement that satisfies the formula `(R - S)∪(S - R)` .
Where R is the `person_visits` table with a filter through January 2, 2022, S is also the `person_visits` table but with a different filter through January 6, 2022. Please do your calculations with sets under the `person_id` column and this column will be alone in a result. Please sort the result by the `person_id` column and present your final SQL in the `v_symmetric_union` (*) database view.

(*) To be honest, the definition of "symmetric union" doesn't exist in set theory. This is the author's interpretation, the main idea is based on the existing rule of symmetric difference.


### Exercise 05 — Let’s calculate a discount price for each person

| Exercise 05: Let’s calculate a discount price for each person ||
|---|---|
| Turn-in directory| ex05 |
| Files to turn-in | `day04_ex05.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please create a Database View `v_price_with_discount` that returns the **orders of a person** with **person name**, **pizza name**, real **price** and calculated column `discount_price` (with applied 10% discount and satisfying formula `price - price*0.1`). Please sort the result by **person names** and **pizza names** and convert the `discount_price` column **to integer type**. See a sample result below.

| name |  pizza_name | price | discount_price |
| ------ | ------ | ------ | ------ | 
| Andrey | cheese pizza | 800 | 720 | 
| Andrey | mushroom pizza | 1100 | 990 |
| ... | ... | ... | ... |


### Exercise 06 — Materialization from virtualization

| Exercise 06: Materialization from virtualization ||
|---|---|
| Turn-in directory| ex06 |
| Files to turn-in | `day04_ex06.sql` |
| **Allowed** ||
| Language| ANSI SQL |

Please create a **Materialized View** `mv_dmitriy_visits_and_eats` (with data included) based on the SQL statement that finds the name of the pizzeria where Dmitriy visited on January 8, 2022 and could eat pizzas for less than 800 rubles (this SQL can be found at Day #02 Exercise #07). 

To check yourself, you can write SQL to the Materialized View `mv_dmitriy_visits_and_eats` and compare the results with your previous query.


### Exercise 07 — Refresh our state

| Exercise 07: Refresh our state||
|---|---|
| Turn-in directory| ex07 |
| Files to turn-in | `day04_ex07.sql` |
| **Allowed** ||
| Language| ANSI SQL |
| **Denied** ||
| SQL Syntax Pattern| Don’t use direct numbers for identifiers of Primary Key, person and pizzeria|

Let's refresh the data in our Materialized View `mv_dmitriy_visits_and_eats` from Exercise #06.
Before this action, please **create** another **Dmitriy** visit that **satisfies the SQL clause of the Materialized View** **except pizzeria**, which we can see in a result from Exercise #06.
After adding a new visit, please **update** a data state for `mv_dmitriy_visits_and_eats`.


### Exercise 08 — Just clear our database

| Exercise 08: Just clear our database ||
|---|---|
| Turn-in directory| ex08 |
| Files to turn-in | `day04_ex08.sql` |
| **Allowed** ||
| Language| ANSI SQL |

After all our exercises, we have a couple of Virtual Tables and a Materialized View. Let's drop them!


