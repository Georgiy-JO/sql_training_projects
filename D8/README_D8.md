# D08 SQL 

Resume: Today you will see how database works with transactions and isolation levels.

# Theory

Database theory has 4 fundamental data anomalies (physical anomalies).
- Lost Update Anomaly;
- Dirty Reads Anomaly;
- Non-repeatable Reads Anomaly;
- Phantom Read Anomaly.

Therefore, there are different isolation levels in ANSI SQL standard that prevent known anomalies.

![D08_02](../misc/images/D08_02.png)

From one point of view, this matrix should be a standard for any Relational Database, but reality... looks a bit different.

||| |
| --- | --- | --- |
| PostgreSQL | ![D08_03](../misc/images/D08_03.png) |
| Oracle | ![D08_04](../misc/images/D08_04.png) |
| MySQL | ![D08_05](../misc/images/D08_05.png) |

Nowadays, IT community found a set of new anomalies based on Database Model (logical view):
- Read Skew Anomaly;
- Write Skew Anomaly;
- Serialization Anomaly;
- Fan Traps Anomaly;
- Chasm Traps Anomaly;
- Data Model Loops Anomaly;
- etc.


## Rules of the day

|Check| Condition|
|---|---|
|✔|Please make sure you have your own database and access for it on your PostgreSQL cluster. |
|✔|Please download a [script](../materials/model.sql) with Database Model here and apply the script to your database (you can use command line with psql or just run it through any IDE, for example DataGrip from JetBrains or pgAdmin from PostgreSQL community). **Our knowledge way is incremental and linear therefore please be aware that all changes you made in Day03 during Exercises 07-13, in Day04 during Exercise 07, in Day06 should be in place (its similar like in real world when we applied a release and need to be consistent with data for new changes).**|
|✔|All tasks contain a list of Allowed and Denied sections with listed database options, database types, SQL constructions etc. Please have a look at this section before you start.|
|✔|Please take a look at the Logical View of our Database Model. |


## DB Structure

<img src="../misc/images/schema_2.png" alt="schema" width="700"/>

|Table|Columns|
|---|---|
|**pizzeria** table (Dictionary Table with available pizzerias)|id — primary key <br>name — name of pizzeria <br>rating — average rating of pizzeria (from 0 to 5 points)|
|**person** table (Dictionary Table with persons who loves pizza)|id — primary key <br>name — name of person <br>age — age of person <br>gender — gender of person <br>address — address of person|
|**menu** table (Dictionary Table with available menu and price for concrete pizza)|id — primary key <br>pizzeria_id — foreign key to pizzeria <br>pizza_name — name of pizza in pizzeria <br>price — price of concrete pizza|
|**person_visits** table (Operational Table with information about visits of pizzeria)|id — primary key <br>person_id — foreign key to person <br>pizzeria_id — foreign key to pizzeria <br>visit_date — date (for example 2022-01-01) of person visit |
|**person_order** table (Operational Table with information about persons orders)|id — primary key <br>person_id — foreign key to person <br>menu_id — foreign key to menu <br>order_date — date (for example 2022-01-01) of person order |
|**person_discounts** table (Operational Table that contains personal discounts of people included in the DB)|id — primary key <br>person_id — foreign key to person <br>pizzeria_id— foreign key to pizzeria <br>discount — information about personal discounts in percent form |


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


### Exercise 00 — Simple transaction

| Exercise 00: Simple transaction ||
|---|---|
| Turn-in directory | ex00 |
| Files to turn-in| `day08_ex00.sql` with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2 |
| **Allowed** ||
| Language|SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line). 

Please provide a proof that your parallel session can’t see your changes until you will make a `COMMIT`;

See the steps below.

1) **Session #1**
    - Update of rating for "Pizza Hut" to 5 points in a transaction mode.
    - Check that you can see a changes in session #1.

2) **Session #2**
    - Check that you can’t see a changes in session #2.

3) **Session #1**
    - Publish your changes for all parallel sessions.

4) **Session #2**
    - Check that you can see a changes in session #2.


So, take a look on example of our output for Session #2.

pizza_db=> select * from pizzeria where name= 'Pizza Hut';
id | name| rating
---+---+---
1 | Pizza Hut |4.6
(1 row)

pizza_db=> select * from pizzeria where name= 'Pizza Hut';
id | name| rating
---+---+---
1 | Pizza Hut |5
(1 row)

You can see that the same query returns different results because the first query was run before publishing in Session#1 and the second query was run after Session#1 was finished.


### Exercise 01 — Lost Update Anomaly

| Exercise 01: Lost Update Anomaly||
|---|---|
| Turn-in directory | ex01 |
| Files to turn-in| `day08_ex01.sql` with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2 |
| **Allowed** ||
| Language|SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line). 

Before running a task, make sure you are at a standard isolation level in your database. Just run the following statement `SHOW TRANSACTION ISOLATION LEVEL;` and the result should be "read committed".

If not, please set the read committed isolation level explicitly on a session level.

|||
| --- | --- |
| Let's examine one of the famous "Lost Update Anomaly" database patterns. You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final results after all the sequential steps for both Sessions. | ![D08_06](../misc/images/D08_06.png) |

Please check a rating for "Pizza Hut" in a transaction mode for both sessions and then make an `UPDATE` of the rating to a value of 4 in Session #1 and make an `UPDATE` of the rating to a value of 3.6 in Session #2 (in the same order as in the picture).


### Exercise 02 — Lost Update for Repeatable Read

| Exercise 02: Lost Update for Repeatable Read||
|---|---|
| Turn-in directory | ex02 |
| Files to turn-in| `day08_ex02.sql` with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2|
| **Allowed** ||
| Language|SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

|||
| --- | --- |
| Let's examine one of the famous "Lost Update Anomaly" database patterns, but under the `REPEATABLE READ` isolation level. You can see a graphical representation of this anomaly on a picture. Horizontal red line means the final results after all sequential steps for both Sessions. | ![D08_07](../misc/images/D08_07.png) |

Please check a rating for "Pizza Hut" in a transaction mode for both sessions and then make an `UPDATE` of the rating to a value of 4 in Session #1 and make an `UPDATE` of the rating to a value of 3.6 in Session #2 (in the same order as in the picture).


### Exercise 03 — Non-Repeatable Reads Anomaly

| Exercise 03: Non-Repeatable Reads Anomaly ||
|---|---|
| Turn-in directory | ex03 |
| Files to turn-in| `day08_ex03.sql` with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2 |
| **Allowed** ||
| Language|SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

|||
| --- | --- |
| Let's check one of the famous "Non-Repeatable Reads" database patterns, but under the `READ COMMITTED` isolation level. You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final result after all sequential steps for both Sessions. | ![D08_08](../misc/images/D08_08.png) |

Please check a rating for "Pizza Hut" in a transaction mode for Session #1 and then make an `UPDATE` of the rating to a value of 3.6 in Session #2 (in the same order as in the picture).


### Exercise 04 — Non-Repeatable Reads for Serialization

| Exercise 04: Non-Repeatable Reads for Serialization ||
|---|---|
| Turn-in directory | ex04 |
| Files to turn-in| `day08_ex04.sql` with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2 |
| **Allowed** ||
| Language|SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

|||
| --- | --- |
| Let's check one of the famous "Non-Repeatable Reads" database patterns, but under the `SERIALIZABLE` isolation level. You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final results after all sequential steps for both Sessions. | ![D08_09](../misc/images/D08_09.png) |

Please check a rating for "Pizza Hut" in a transaction mode for Session #1, and then make an `UPDATE` of the rating to a value of 3.0 in Session #2 (in the same order as in the picture).


### Exercise 05 — Phantom Reads Anomaly

| Exercise 05: Phantom Reads Anomaly||
|---|---|
| Turn-in directory | ex05 |
| Files to turn-in| `day08_ex05.sql`with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2 |
| **Allowed** ||
| Language| SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

|||
| --- | --- |
| Let's check one of the famous "phantom reads" database patterns, but under the `READ COMMITTED` isolation level. You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final results after all sequential steps for both Sessions. | ![D08_10](../misc/images/D08_10.png) |

Please summarize all ratings for all pizzerias in one transaction mode for Session #1 and then make `INSERT` of the new restaurant 'Kazan Pizza' with rating 5 and ID=10 in Session #2 (in the same order as in the picture).
 

### Exercise 06 — Phantom Reads for Repeatable Read

| Exercise 06: Phantom Reads for Repeatable Read||
|---|---|
| Turn-in directory | ex06 |
| Files to turn-in| `day08_ex06.sql`with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2 |
| **Allowed** ||
| Language|SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

|||
| --- | --- |
| Let's check one of the famous "Phantom Reads" database patterns, but under the isolation level `REPEATABLE READ`. You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final results after all sequential steps for both Sessions. | ![D08_11](../misc/images/D08_11.png) |

Please summarize all ratings for all pizzerias in one transaction mode for Session #1 and then make `INSERT` of the new restaurant 'Kazan Pizza 2' with rating 4 and ID=11 in Session #2 (in the same order as in the picture).


### Exercise 07 — Deadlock

| Exercise 07: Deadlock||
|---|---|
| Turn-in directory | ex07 |
| Files to turn-in| `day08_ex07.sql`with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2|
| **Allowed** ||
| Language|SQL|

Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users. 

Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

Let’s reproduce a deadlock situation in our database. 


|||
| --- | --- |
| You can see a graphical representation of the deadlock situation in a picture. It looks like a "Christ-lock" between parallel sessions. | ![D08_12](../misc/images/D08_12.png) |

Please write any SQL statement with any isolation level (you can use the default setting) on the table `pizzeria` to reproduce this deadlock situation.
