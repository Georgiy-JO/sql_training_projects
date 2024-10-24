## Contents:
- [[#Что концептуально представляют собой атрибуты сущности в ER-модели?|Что концептуально представляют собой атрибуты сущности в ER-модели?]]
- [[#Какой из языков обычно используются для описания логический модулей данных? (HTML  UML  JSON  SQL)|Какой из языков обычно используются для описания логический модулей данных? (HTML  UML  JSON  SQL)]]
- [[#Какое из следующих понятий описывает связь между двумя сущностями в логической модели данных? (Хеш-код  Тригер  Индекс  ВнешнийКлюч)|Какое из следующих понятий описывает связь между двумя сущностями в логической модели данных? (Хеш-код  Тригер  Индекс  ВнешнийКлюч)]]
- [[#Что представляют собой первая нормальная форма (1NF) в реляционном дизайне баз данных?|Что представляют собой первая нормальная форма (1NF) в реляционном дизайне баз данных?]]
- [[#Что такое первичный ключ в физ-ской модели данных?|Что такое первичный ключ в физ-ской модели данных?]]
- [[#Какое действие будет предпринято, если объект CHECK CONSTRAINT не пройдет при вставке или обновлении данных?|Какое действие будет предпринято, если объект CHECK CONSTRAINT не пройдет при вставке или обновлении данных?]]
- [[#Какая команда используется для создани FOREIGN KEY?|Какая команда используется для создани FOREIGN KEY?]]
- [[#Какая DDL команда используется для создания CHECK CONSTRAINT?|Какая DDL команда используется для создания CHECK CONSTRAINT?]]
- [[#Что подходит и не подходит под термин <Реляционная база данных>?|Что подходит и не подходит под термин <Реляционная база данных>?]]
- [[#Кто управляет доступами к данным в реляционной базе данных?|Кто управляет доступами к данным в реляционной базе данных?]]
- [[#Что означает оббривиатура "CAP" в  концепции CAP-теоремы?|Что означает оббривиатура "CAP" в  концепции CAP-теоремы?]]
- [[#Какие из БД удовлетворяют "CA" а какие "AP" из "CAP" (HBase, MySQL, Cassandra, PostgreSQL)?|Какие из БД удовлетворяют "CA" а какие "AP" из "CAP" (HBase, MySQL, Cassandra, PostgreSQL)?]]
- [[#Какой принцип гарантии ACID , гарантирует, что если транзакция прошла успешно, изменения будут сохранены даже в случае сбоя системы?|Какой принцип гарантии ACID , гарантирует, что если транзакция прошла успешно, изменения будут сохранены даже в случае сбоя системы?]]
- [[#DDL　команда для создвния составного индекса в БД|DDL　команда для создвния составного индекса в БД]]
- [[#Kакая из служб управляет доступом к данным в реляционной БД (transaction manager, query optimizer, DBMS, sql server)|Kакая из служб управляет доступом к данным в реляционной БД (transaction manager, query optimizer, DBMS, sql server)]]
- [[#Какие типы индексов поддерживаются в реляционной БД (кластерные, уникальные, полнотекстовые, гибкие)?|Какие типы индексов поддерживаются в реляционной БД (кластерные, уникальные, полнотекстовые, гибкие)?]]
- [[#Какие элемента ER-модели используются для связи сущностей (атрибуты, линии, таблицы, ключи)?|Какие элемента ER-модели используются для связи сущностей (атрибуты, линии, таблицы, ключи)?]]
- [[#Какова цель логического моделирования данных (минимализация объема хранимой информации, представление структур данных независимо от используемой СУБД, создание пользовательского интерфейса, оптимизация запросов к БД)?|Какова цель логического моделирования данных (минимализация объема хранимой информации, представление структур данных независимо от используемой СУБД, создание пользовательского интерфейса, оптимизация запросов к БД)?]]
- [[#Что из перечисленного является методом нормализации логической модели (иерархическое разбиение, денормализация, многозначительная зависимость, функциональная зависимость)?|Что из перечисленного является методом нормализации логической модели (иерархическое разбиение, денормализация, многозначительная зависимость, функциональная зависимость)?]]
- [[#Какой фактор из перечисленных НЕ влияет на процесс проектирования физической модели (инструменты проектирования, объем данных, требования к производительности, сложность бизнес-логики)?|Какой фактор из перечисленных НЕ влияет на процесс проектирования физической модели (инструменты проектирования, объем данных, требования к производительности, сложность бизнес-логики)?]]
- [[#Какие пользовательские операции в основном выполняются в реляционной БД, выбрать из перечисленного (JSON, HTTP, CRUD, RAD)?|Какие пользовательские операции в основном выполняются в реляционной БД, выбрать из перечисленного (JSON, HTTP, CRUD, RAD)?]]
- [[#Какие типы баз данных из перечисленных используются для  работы с соц. сетями и рекомендательными системами (SQL, NoSQL, графовые, документальные)?|Какие типы баз данных из перечисленных используются для  работы с соц. сетями и рекомендательными системами (SQL, NoSQL, графовые, документальные)?]]
- [[#Выведет ли ошибку следующий запрос: SELECT id FROM ... WHERE id NOT IN (SELECT ...);|Выведет ли ошибку следующий запрос: SELECT id FROM ... WHERE id NOT IN (SELECT ...);]]

## Что концептуально представляют собой атрибуты сущности в ER-модели?

Атрибуты сущности в ER-модели (Entity-Relationship Model, модель "сущность-связь") — это характеристики или свойства, которые описывают конкретную сущность. Концептуально атрибуты представляют собой данные, относящиеся к сущности, и помогают отличить одну сущность от другой.

### Основные концептуальные аспекты атрибутов:
1. **Описание сущности**: Каждый атрибут содержит информацию, которая описывает определённую характеристику сущности. Например, если сущность — это "Сотрудник", атрибутами могут быть "Имя", "Дата рождения", "Должность", "Зарплата".
   
2. **Уникальность**: Некоторые атрибуты могут быть уникальными для каждой сущности и использоваться для её однозначной идентификации. Например, атрибут "ID" для сущности "Сотрудник".

3. **Тип данных**: Атрибуты могут иметь различные типы данных, такие как строки (имена), числа (зарплата), даты (дата рождения) и т.д.

4. **Обязательные и необязательные**: Некоторые атрибуты могут быть обязательными (должны всегда иметь значение), другие — необязательными.

5. **Простые и составные атрибуты**:
   - **Простые атрибуты**: неделимые, не могут быть разделены на меньшие части. Например, "Имя".
   - **Составные атрибуты**: могут быть разделены на несколько подчастей. Например, "Адрес" может включать "Улицу", "Город", "Страну".

6. **Однозначные и многозначные атрибуты**:
   - **Однозначные**: для одной сущности может быть только одно значение атрибута. Например, "Дата рождения".
   - **Многозначные**: могут иметь несколько значений. Например, "Телефонный номер" для одного сотрудника может включать несколько номеров.

### Summered up: 
Таким образом, атрибуты сущности — это конкретные данные, которые описывают сущность и позволяют различать экземпляры сущности в модели данных.

## Какой из языков обычно используются для описания логический модулей данных? (HTML  UML  JSON  SQL)

Для описания логических моделей данных обычно используется **UML** (Unified Modeling Language) и **SQL** (Structured Query Language).

- **UML**: Используется для визуального моделирования и описания структуры системы, включая логические модели данных. В UML можно создавать диаграммы классов, диаграммы сущностей и связей (ER-диаграммы), которые показывают сущности, их атрибуты и связи между ними.

- **SQL**: Используется для описания и манипуляции данными в реляционных базах данных. С помощью SQL можно создавать таблицы, которые являются физическим воплощением логических моделей данных, а также определять их атрибуты, типы данных и связи между таблицами (сущностями).

### Summered up:
Таким образом, **UML** и **SQL** наиболее часто используются для описания логических моделей данных.


## Какое из следующих понятий описывает связь между двумя сущностями в логической модели данных? (Хеш-код  Тригер  Индекс  ВнешнийКлюч)

Внешний ключ (foreign key) — это атрибут в одной таблице, который ссылается на первичный ключ другой таблицы. Он используется для создания связи между сущностями (таблицами) и обеспечения целостности данных. Внешний ключ определяет отношение между двумя таблицами, например, связь "один ко многим" или "многие ко многим".
#### Summered up 3: 
Внешний ключ.

## Что представляют собой первая нормальная форма (1NF) в реляционном дизайне баз данных?

**Первая нормальная форма (1NF)** в реляционном дизайне баз данных — это набор правил, который определяет структуру таблицы таким образом, чтобы данные были организованы упорядоченно и без избыточности. Основные принципы 1NF заключаются в следующем:

1. **Все атрибуты должны быть атомарными**:
    - Данные в каждой колонке должны быть неделимыми. Это означает, что каждое значение в таблице должно представлять собой единичное, неделимое значение, а не набор значений. Например, если у таблицы есть колонка "Телефоны", она не должна содержать несколько номеров телефонов через запятую, а каждый телефон должен быть записан в отдельной строке или вынесен в отдельную таблицу.
      
2. **Каждая колонка должна содержать данные одного типа**:
    - В таблице каждая колонка должна содержать данные определённого типа. Например, колонка "Возраст" должна содержать только числа, а колонка "Имя" — только строки. Не должно быть смешения типов данных в одной колонке.
      
3. **Все строки таблицы должны быть уникальными**:
    - В таблице не должно быть дублирующихся строк. Чтобы гарантировать это, каждая строка должна быть идентифицирована уникальным ключом (например, первичным ключом).
    
4. **Порядок строк и столбцов не имеет значения**:
    - Порядок данных в строках и столбцах таблицы не влияет на логическую структуру таблицы. Важно только, чтобы данные соответствовали своим колонкам.

## Что такое первичный ключ в физ-ской модели данных?

**Первичный ключ (Primary Key)** в физической модели данных — это один или несколько атрибутов (полей) таблицы, которые однозначно идентифицируют каждую запись (строку) в этой таблице. Первичный ключ играет ключевую роль в обеспечении целостности данных и их уникальности в рамках одной таблицы.
### Основные свойства первичного ключа:

1. **Уникальность**:
    - Каждое значение первичного ключа должно быть уникальным. Это означает, что не может существовать двух записей с одинаковым значением первичного ключа в одной таблице.
2. **Отсутствие NULL-значений**:
    - Поля, составляющие первичный ключ, не могут содержать значение `NULL`. Каждая запись должна иметь конкретное значение для первичного ключа.
3. **Минимальность**:
    - Первичный ключ должен содержать минимальное количество полей, необходимых для уникальной идентификации записи. То есть не следует включать лишние атрибуты, если одного достаточно для уникальной идентификации.
4. **Постоянство**:
    - Значение первичного ключа не должно изменяться в течение времени, так как оно используется для идентификации записи и может ссылаться на другие таблицы через внешние ключи.

## Какое действие будет предпринято, если объект CHECK CONSTRAINT не пройдет при вставке или обновлении данных?

Если объект CHECK CONSTRAINT не будет удовлетворен при вставке или обновлении данных, база данных выполнит следующее действие:

Запрос на вставку или обновление будет отклонен, и система вернет ошибку, указывающую на нарушение ограничения. Данные, которые не соответствуют условию, не будут сохранены в таблице.

### Что такое CHECK CONSTRAINT?
CHECK CONSTRAINT — это ограничение на уровне таблицы, которое устанавливает условие, которому должны соответствовать данные, добавляемые или обновляемые в определенной колонке или нескольких колонках. Если данные не удовлетворяют этому условию, операция вставки или обновления отклоняется.

## Какая команда используется для создани FOREIGN KEY?

Команда для создания **FOREIGN KEY** (внешнего ключа) используется в SQL для установления связи между двумя таблицами. Внешний ключ в одной таблице ссылается на первичный ключ в другой таблице, что обеспечивает целостность данных.

### Синтаксис создания FOREIGN KEY при создании таблицы:
```SQL
CREATE TABLE имя_таблицы (
    имя_поля_1 тип_данных,
    имя_поля_2 тип_данных,
    -- Другие поля
    CONSTRAINT имя_ограничения FOREIGN KEY (имя_поля_внешнего_ключа) 
    REFERENCES имя_другой_таблицы (имя_поля_в_другой_таблице)
);
```

### Добавление FOREIGN KEY в уже существующую таблицу:
```SQL
ALTER TABLE имя_таблицы
ADD CONSTRAINT имя_ограничения FOREIGN KEY (имя_поля_внешнего_ключа)
REFERENCES имя_другой_таблицы (имя_поля_в_другой_таблице);
```

## Какая DDL команда используется для создания CHECK CONSTRAINT?

### Синтаксис создания CHECK CONSTRAINT при создании таблицы:
```SQL
CREATE TABLE имя_таблицы (
    имя_поля тип_данных,
    -- Другие поля
    CONSTRAINT имя_ограничения CHECK (условие)
);
```
### Добавление CHECK CONSTRAINT в уже существующую таблицу:
```SQl
ALTER TABLE имя_таблицы
ADD CONSTRAINT имя_ограничения CHECK (условие);
```

## Что подходит и не подходит под термин <Реляционная база данных>?

Реляционная база данных (РБД) — это тип базы данных, в которой данные организованы в виде таблиц (называемых также реляциями), состоящих из строк и столбцов. Каждая таблица представляет собой сущность, где строки (записи) хранят экземпляры сущностей, а столбцы (поля) хранят атрибуты или характеристики этих сущностей.
#### Основные характеристики реляционной базы данных:
##### Таблицы:
* Данные организованы в таблицы, каждая из которых имеет уникальное имя. В таблице строки представляют отдельные записи, а столбцы — атрибуты этих записей.
##### Строки и столбцы:
* Строки (записи): каждая строка представляет отдельный объект или экземпляр сущности, например, запись о конкретном клиенте, сотруднике или продукте.
* Столбцы (поля): каждый столбец представляет атрибут или характеристику сущности. Например, имя, дата рождения или адрес.
##### Первичный ключ (Primary Key):
* Каждая таблица должна иметь первичный ключ — одно или несколько полей, которые однозначно идентифицируют каждую запись в таблице. Первичный ключ гарантирует, что каждая запись уникальна.
##### Внешний ключ (Foreign Key):
* Внешние ключи используются для установления связей между таблицами. Внешний ключ ссылается на первичный ключ другой таблицы, что позволяет связывать данные в разных таблицах и поддерживать целостность данных.
##### Отношения (реляции):
* Основной концепцией реляционных баз данных является возможность создания отношений между таблицами. Эти отношения могут быть такими, как "один ко многим", "многие ко многим" или "один к одному". Это позволяет организовывать сложные структуры данных, сохраняя их взаимосвязи.

#### Примеры 
* MySql
* PostgreSql
* Oracle
#### Summery: 
Под определение подходит любая БД удовлетворяющая вышеперечисленным условиям.
### Не подходит

#### Под термин **«реляционная база данных»** ***не подходят*** следующие аспекты и технологии, так как они не соответствуют основным характеристикам реляционной базы данных:
##### 1. **Иерархическая или сетевая модель данных**
   - **Иерархическая базы данных** организованы в древовидную структуру, где данные хранятся в виде иерархии узлов (родитель-ребенок). Примером является IBM IMS.
   - **Сетевая модель** представляет собой структуру, в которой каждый узел может иметь несколько связей с другими узлами. Это сложная структура, отличающаяся от таблиц в реляционных базах данных. Пример — модель базы данных CODASYL.
##### 2. **NoSQL базы данных**
   - **Документоориентированные базы данных** (например, MongoDB) используют структуру данных, основанную на документах, а не на таблицах. В таких базах данные хранятся в виде JSON- или BSON-документов.
   - **Графовые базы данных** (например, Neo4j) организуют данные в виде узлов и связей (рёбер), которые моделируют сложные взаимоотношения. Они ориентированы на работу с графовыми структурами, а не с таблицами.
   - **Ключ-значение базы данных** (например, Redis) хранят данные в виде пар "ключ-значение", и у них нет сложных отношений между данными, как в реляционных базах данных.
   - **Колонкоориентированные базы данных** (например, Cassandra) хранят данные в формате колонок, что позволяет эффективно обрабатывать большие объемы данных, но это отличается от организации данных в виде строк и столбцов в реляционной базе.
##### 3. **Отсутствие строгой структуры данных**
   - В реляционной базе данных требуется строгая схема (структура), где каждый столбец таблицы должен иметь заранее определённый тип данных (например, INT, VARCHAR). В противоположность этому, некоторые системы баз данных, такие как NoSQL, могут работать с данными, которые не требуют заранее определённой схемы или могут быть изменены динамически.
##### 4. **Отсутствие отношений между таблицами**
   - Реляционные базы данных поддерживают концепцию отношений между таблицами через внешние ключи (FOREIGN KEY) и позволяют создавать сложные запросы с JOIN. Если система баз данных не поддерживает такие отношения или не использует концепцию внешних ключей, это не соответствует определению реляционной базы данных.
##### 5. **Файловые системы**
   - **Файловые системы** (например, NTFS, FAT) хранят данные в виде файлов и папок и не предоставляют механизмов для создания структурированных таблиц, первичных и внешних ключей или выполнения сложных SQL-запросов. Это не база данных, а система для хранения файлов.
##### 6. **Не поддерживает SQL**
   - Реляционные базы данных предполагают использование **SQL** (Structured Query Language) для работы с данными: создания, манипуляции и запросов. Если система не поддерживает SQL или другой аналогичный язык для работы с таблицами, её нельзя отнести к реляционным базам данных.
##### 7. **Неструктурированные данные**
   - **Неструктурированные данные**, такие как медиафайлы, аудио, видео или текстовые документы без явной схемы данных, не подходят под концепцию реляционных баз данных. Реляционные базы данных требуют явной структуры и организации данных в виде строк и столбцов.
   - 
#### Пример того, что НЕ является реляционной базой данных:
   - **MongoDB** (документоориентированная NoSQL база данных): не использует таблицы или реляции, а хранит данные в виде документов JSON, что нарушает основные принципы реляционной модели.
   - **Neo4j** (графовая база данных): хранит данные в виде узлов и рёбер (графов), что кардинально отличается от таблиц реляционных баз данных.

#### Summery: 
Любая система, которая **не использует таблицы** для организации данных, **не поддерживает реляционные связи** между данными (через первичные и внешние ключи) и **не применяет SQL** для работы с данными, **не является реляционной базой данных**.

## Кто управляет доступами к данным в реляционной базе данных?

В реляционной базе данных управление доступом к данным обычно осуществляется следующими компонентами:
### Инструмент: **Система управления базами данных (СУБД)**
   - **СУБД** — это программное обеспечение, которое обеспечивает создание, управление и работу с базами данных. СУБД играет ключевую роль в управлении доступом к данным, поскольку она контролирует, кто и как может взаимодействовать с базой данных. Популярные СУБД включают MySQL, PostgreSQL, Oracle, Microsoft SQL Server и другие.
###  Субъект: **Администраторы баз данных (DBA)**
   - **DBA** — это специалисты, ответственные за управление базами данных, включая безопасность, доступ и целостность данных. Они создают пользователей, назначают права доступа и настраивают различные уровни доступа к данным в зависимости от ролей пользователей. Например, DBA может предоставить пользователям право только на чтение данных (SELECT) или разрешить им изменять данные (INSERT, UPDATE, DELETE).
### Средства: 
####  **Ролевое управление доступом**
   - В большинстве СУБД используется **ролевое управление доступом** (Role-Based Access Control, RBAC). В этой модели права доступа назначаются не отдельным пользователям, а ролям. 
####  **Уровни доступа**
   - СУБД предоставляет различные уровни доступа к данным:
     - **Полный доступ** (возможность выполнять все операции: SELECT, INSERT, UPDATE, DELETE).
     - **Чтение** (только доступ для извлечения данных с помощью операций SELECT).
     - **Запись** (возможность добавления и обновления данных, но не удаления).
     - **Управление** (права на создание или изменение структуры таблиц и управление другими пользователями).
#### **Контроль доступа на уровне строки**
   - В некоторых системах реализуется **контроль доступа на уровне строки**, который позволяет устанавливать права доступа не только на уровне таблиц, но и для отдельных записей. 
### Summery: 
**Управление доступом к данным** в реляционной базе данных осуществляется через **СУБД**, **администраторами баз данных (DBA)** и пользователями, в соответствии с **ролевым управлением доступом** на базе различий в **уровнях доступа**.

## Что означает оббривиатура "CAP" в  концепции CAP-теоремы?

Оббривиатура  **CAP** в концепции **CAP-теоремы** обозначает три ключевых свойства, которые база данных распределённого типа может обеспечивать:

1. **Consistency (Согласованность)**:
   - Все узлы системы видят одни и те же данные одновременно. Если один узел обновляет данные, все другие узлы должны отразить это изменение, и пользователи всегда получают актуальные данные.

2. **Availability (Доступность)**:
   - Каждое запрос к системе получает ответ, независимо от того, доступен ли узел, на котором хранятся запрашиваемые данные. Это означает, что система всегда отвечает на запросы, даже если часть узлов не функционирует.

3. **Partition Tolerance (Устойчивость к разделению)**:
   - Система продолжает функционировать, даже если существует разделение сети, которое мешает узлам обмениваться данными. Это важно для распределённых систем, так как они могут сталкиваться с сетевыми сбоями.

### CAP-теорема
**CAP-теорема** утверждает, что в распределённых системах невозможно одновременно обеспечить все три свойства. В условиях сетевых разделений (что всегда возможно) системы могут гарантировать только два из трёх свойств. Таким образом, можно выделить три возможные стратегии:

1. **CA (Согласованность и доступность)**: 
   - Система обеспечивает согласованность и доступность, но не может гарантировать устойчивость к разделению. Если происходит сетевое разделение, система может перестать отвечать на запросы, чтобы поддерживать согласованность данных.

2. **CP (Согласованность и устойчивость к разделению)**:
   - Система обеспечивает согласованность и устойчивость к разделению, но может не быть доступной. В случае сетевого разделения система может отказать в обслуживании запросов, чтобы избежать ситуации, когда разные узлы имеют различные данные.

3. **AP (Доступность и устойчивость к разделению)**:
   - Система обеспечивает доступность и устойчивость к разделению, но не гарантирует согласованность. Это означает, что данные могут быть не согласованными между узлами во время сетевого разделения, но система продолжает работать и отвечает на запросы.

### Summery: 
**CAP** — это ключевое понятие в теории распределённых систем, описывающее компромиссы между **согласованностью**, **доступностью** и **устойчивостью к разделению**, и помогает разработчикам принимать решения при проектировании распределённых баз данных и систем.


## Какие из БД удовлетворяют "CA" а какие "AP" из "CAP" (HBase, MySQL, Cassandra, PostgreSQL)?

В соответствии с теорией CAP (Consistency, Availability, Partition tolerance), базы данных можно классифицировать следующим образом:
### **CA (Consistency and Availability):**
Эти базы данных обеспечивают строгую согласованность и доступность, но не могут гарантировать устойчивость к разделению сети (partition tolerance).
- **MySQL**: В большинстве конфигураций MySQL (особенно в режиме репликации) обеспечивает согласованность и доступность, но в случае сетевых разделений может возникнуть потеря доступности.
- **PostgreSQL**: Обычно также относится к CA, обеспечивая высокую согласованность и доступность, хотя при настройке репликации может сталкиваться с проблемами при разделении сети.
### **AP (Availability and Partition tolerance):**
Эти базы данных обеспечивают доступность и устойчивость к разделению сети, но могут жертвовать строгой согласованностью.
- **Cassandra**: Это распределенная база данных, которая ориентирована на высокую доступность и устойчивость к разделению, что делает её классическим примером AP.
- **HBase**: Несмотря на то что HBase может предоставлять определённый уровень согласованности, в условиях разделения сети она будет обеспечивать доступность и будет более устойчивой к потере согласованности.
### Итог:
- **CA**: MySQL, PostgreSQL
- **AP**: Cassandra, HBase

## Какой принцип гарантии ACID , гарантирует, что если транзакция прошла успешно, изменения будут сохранены даже в случае сбоя системы?

Принцип, который гарантирует, что если транзакция прошла успешно, изменения будут сохранены даже в случае сбоя системы, называется **Durability (Долговечность)**.

### Принципы ACID
ACID — это набор свойств, которые обеспечивают надежность и целостность транзакций в реляционных базах данных. Каждая буква в аббревиатуре означает следующее:

1. **Atomicity (Атомарность)**:
   - Гарантирует, что все операции в рамках транзакции выполняются полностью или не выполняются вовсе. Если одна из операций не удалась, то вся транзакция откатывается к исходному состоянию.

2. **Consistency (Согласованность)**:
   - Гарантирует, что транзакция переводит базу данных из одного согласованного состояния в другое. Это означает, что все правила и ограничения, определенные для базы данных, должны соблюдаться до и после транзакции.

3. **Isolation (Изоляция)**:
   - Гарантирует, что параллельные транзакции не влияют друг на друга. Каждая транзакция должна выполняться так, как если бы она была единственной в системе, даже если несколько транзакций выполняются одновременно.

4. **Durability (Долговечность)**:
   - Гарантирует, что после завершения транзакции (при условии успешного выполнения) все изменения, сделанные этой транзакцией, будут сохранены даже в случае сбоя системы (например, сбоя питания, падения сервера и т.д.). Это достигается за счет записи изменений на постоянные носители, такие как жесткие диски или SSD.
### Summery: 
**Durability** — это ключевой аспект принципа ACID, который обеспечивает сохранность данных и гарантирует, что успешно выполненные транзакции останутся в базе данных даже в условиях сбоя.

## DDL　команда для создвния составного индекса в БД

Oбщий синтаксис для создания составного индекса:
```SQL 
CREATE INDEX имя_индекса
ON имя_таблицы (столбец1, столбец2, ...);

```

## Kакая из служб управляет доступом к данным в реляционной БД (transaction manager, query optimizer, DBMS, sql server)

Управление доступом к данным в реляционной базе данных осуществляет **Система управления базами данных (DBMS)**. 

### Объяснение:

- **DBMS (Database Management System)**:
  - Это программное обеспечение, которое управляет базами данных и обеспечивает их хранение, обработку и безопасность. DBMS отвечает за управление доступом к данным, включая аутентификацию пользователей, назначение прав доступа и контроль за выполнением операций с данными. Оно обеспечивает механизмы для реализации политик безопасности и управления доступом на уровне пользователей и ролей.

### Другие термины:

- **Transaction Manager**:
  - Отвечает за управление транзакциями, включая их атомарность, согласованность, изоляцию и долговечность (ACID). Он не управляет непосредственно доступом к данным, а управляет выполнением транзакций.

- **Query Optimizer**:
  - Это компонент DBMS, который отвечает за оптимизацию запросов. Он анализирует запросы и выбирает наиболее эффективный способ их выполнения, но не управляет доступом к данным.

- **SQL Server**:
  - Это конкретная реляционная СУБД, разработанная Microsoft. Хотя SQL Server включает в себя функционал для управления доступом, термин "SQL Server" обозначает конкретную систему, а не службу управления доступом как таковую.

### Итог
**DBMS** (Система управления базами данных) является службой, которая управляет доступом к данным в реляционной базе данных, обеспечивая безопасность, контроль доступа и управление пользователями.


## Какие типы индексов поддерживаются в реляционной БД (кластерные, уникальные, полнотекстовые, гибкие)?

В реляционных базах данных (РБД) существует несколько типов индексов, которые используются для ускорения поиска данных и повышения производительности запросов. Индексы создаются на столбцы таблиц для быстрого доступа к строкам без необходимости полного сканирования всей таблицы. Вот основные типы индексов, которые поддерживаются в большинстве реляционных баз данных:
### 1. **Обычный индекс (B-Tree или Balanced Tree Index)**
Это наиболее распространённый и универсальный тип индекса, который используется по умолчанию в большинстве реляционных СУБД. B-дерево (балансированное дерево) организует данные в сбалансированной древовидной структуре, что позволяет эффективно выполнять операции поиска, вставки и удаления.
- Подходит для использования при запросах с операциями:
  - `SELECT`
  - `WHERE` (поиск по условию)
  - `ORDER BY` (сортировка данных)
  - `GROUP BY` (группировка данных)
### 2. **Уникальный индекс (Unique Index)**
Этот тип индекса гарантирует уникальность значений в индексируемом столбце или наборе столбцов. Уникальный индекс автоматически накладывает ограничение, что в таблице не может быть двух записей с одинаковым значением в этом столбце.
- Чаще всего используется для создания первичных ключей (`PRIMARY KEY`) и уникальных ключей (`UNIQUE`).
### 3. **Составной индекс (Composite Index)**
Составной индекс создаётся на нескольких столбцах одной таблицы. Он используется для оптимизации запросов, которые часто обращаются сразу к нескольким полям. Важно отметить, что порядок столбцов в составном индексе имеет значение, и он будет эффективен только в запросах, использующих этот порядок.
- Пример: индекс на комбинацию столбцов `(Фамилия, Имя, Дата рождения)` будет полезен для запросов, которые ищут данные по фамилии и имени, но менее эффективен, если поиск идёт только по имени.
### 4. **Кластерный индекс (Clustered Index)**
Кластерный индекс изменяет физический порядок данных в таблице, чтобы строки данных соответствовали порядку индекса. У каждой таблицы может быть только один кластерный индекс, поскольку данные могут быть отсортированы только одним образом.
- В таблице с кластерным индексом данные физически хранятся в отсортированном виде по ключу этого индекса.
- В большинстве СУБД первичный ключ (`PRIMARY KEY`) автоматически создаёт кластерный индекс.
### 5. **Некластерный индекс (Non-clustered Index)**
Некластерный индекс создаётся отдельно от физического порядка данных. Это означает, что строки данных не изменяют своего порядка в таблице, а индекс хранит указатели на физическое местоположение данных.
- В одной таблице может быть несколько некластерных индексов.
- Это наиболее часто используемый тип индекса, особенно для вторичных ключей или для ускорения поиска по полям, не являющимся частью первичного ключа.
### 6. **Полнотекстовый индекс (Full-Text Index)**
Полнотекстовый индекс используется для быстрого поиска текста в больших текстовых полях (например, в столбцах с типами данных `TEXT` или `VARCHAR`). Этот тип индекса помогает эффективно искать данные по частичному совпадению слов или фраз, игнорируя пробелы и другие символы.
- Чаще всего применяется в системах, где требуется поиск по документам, статьям или другим текстовым данным (например, поисковые запросы на веб-сайтах).
### 7. **Пространственный индекс (Spatial Index)**
Этот тип индекса используется для оптимизации запросов к данным с географическими координатами, такими как координаты долготы и широты. Пространственные индексы применяются для обработки геометрических объектов (например, точек, линий, полигонов) и эффективного выполнения операций поиска, таких как ближайшие соседи.
- Пример использования: поиск ближайших объектов (магазинов, ресторанов) по географическим координатам.
### 8. **Bitmap-индекс (Bitmap Index)**
Bitmap-индексы применяются для колонок, содержащих небольшое количество уникальных значений (например, столбцы с булевыми значениями или перечислениями). В таких индексах используются битовые массивы для представления данных, что позволяет быстро выполнять логические операции.
- Чаще всего используется в хранилищах данных и системах аналитической обработки, поскольку он эффективен для выполнения запросов по агрегированию данных.
### 9. **XML-индекс**
Индексы этого типа создаются для оптимизации запросов к данным, хранящимся в формате XML. XML-индекс помогает ускорить поиск и извлечение данных внутри XML-документов, хранящихся в реляционных таблицах.
### 10. **Функциональный индекс (Expression Index)**
Функциональные индексы строятся на результатах выражений или функций, применённых к данным в таблице. Например, можно создать индекс на функцию, которая преобразует значения в нижний регистр (`LOWER(column_name)`), чтобы ускорить поиск данных, независимо от регистра символов.
### Заключение
Типы индексов в реляционной базе данных обеспечивают разные способы ускорения выполнения запросов и манипуляции данными. Выбор подходящего индекса зависит от характера запросов, структуры данных и требований к производительности.

## Какие элемента ER-модели используются для связи сущностей (атрибуты, линии, таблицы, ключи)?

Для связи сущностей в ER-модели используются следующие элементы:
### 1. **Линии (Lines)**:
- **Линии** — основной элемент, который непосредственно соединяет сущности с их связями. Линии указывают на то, что две сущности имеют взаимосвязь. Эти линии могут также включать обозначения кардинальности, чтобы показать тип связи (один к одному, один ко многим, многие ко многим).
- 
### 2. **Ключи (Keys)**:
- **Первичный ключ (Primary Key)** и **внешний ключ (Foreign Key)** — важные элементы для установления и поддержания связей между сущностями.
    - **Первичный ключ** используется для уникальной идентификации записей внутри сущности.
    - **Внешний ключ** — это поле в одной сущности, которое ссылается на первичный ключ другой сущности, устанавливая связь между этими сущностями. Например, внешние ключи часто используются для реализации связей "один ко многим" или "многие ко многим".

## Какова цель логического моделирования данных (минимализация объема хранимой информации, представление структур данных независимо от используемой СУБД, создание пользовательского интерфейса, оптимизация запросов к БД)?

Цели логического моделирования данных из предложенного списка:
1. **Представление структур данных независимо от используемой СУБД** — это основная цель логического моделирования, поскольку оно фокусируется на абстрактном описании данных и их взаимосвязей, не привязываясь к конкретным технологиям.

Дополнительные цели могут включать:
- **Минимализация объема хранимой информации** (косвенно, через нормализацию, но не является основной целью).
- **Оптимизация запросов к БД** (может быть косвенной целью, но не является основной целью логического моделирования).

## Что из перечисленного является методом нормализации логической модели (иерархическое разбиение, денормализация, многозначительная зависимость, функциональная зависимость)?

Из перечисленного **функциональная зависимость** является методом нормализации логической модели. 
### Объяснения:
- **Функциональная зависимость**: Это ключевое понятие в нормализации, которое описывает отношения между атрибутами в реляционной базе данных. Если атрибут A функционально зависит от атрибута B, это означает, что для каждого значения B существует единственное значение A. Это понятие используется для выявления и устранения избыточности в данных.
### Остальные термины:
- **Иерархическое разбиение**: Это не метод нормализации, а скорее способ организации данных (например, в иерархических базах данных).
- **Денормализация**: Это процесс, обратный нормализации, который используется для повышения производительности базы данных, но может привести к избыточности данных.
- **Многозначительная зависимость**: Это понятие также относится к нормализации, но скорее к конкретным формам нормализации (например, 4NF), а не является методом нормализации в общем смысле.

## Какой фактор из перечисленных НЕ влияет на процесс проектирования физической модели (инструменты проектирования, объем данных, требования к производительности, сложность бизнес-логики)?

Из перечисленных факторов **инструменты проектирования** НЕ влияют на процесс проектирования физической модели.
### Объяснение:
- **Инструменты проектирования**: Хотя они могут облегчить процесс моделирования и реализации, выбор инструментов сам по себе не влияет на то, как будет структурирована физическая модель. Они могут лишь помочь в её создании.
### Остальные факторы:
- **Объем данных**: Большой объем данных может потребовать более тщательного проектирования физической модели для оптимизации хранения и производительности.
- **Требования к производительности**: Высокие требования к производительности влияют на выбор архитектуры, индексов и других аспектов физической модели.
- **Сложность бизнес-логики**: Сложная бизнес-логика может потребовать более детального проектирования и оптимизации физической модели для корректной реализации всех бизнес-процессов.

## Какие пользовательские операции в основном выполняются в реляционной БД, выбрать из перечисленного (JSON, HTTP, CRUD, RAD)?

Из перечисленного **CRUD** является набором пользовательских операций, которые в основном выполняются в реляционной базе данных.
### Объяснение:
- **CRUD**: Это акроним, который обозначает четыре основные операции, выполняемые над данными:
  - **C**reate (Создание) — добавление новых записей.
  - **R**ead (Чтение) — получение и просмотр данных.
  - **U**pdate (Обновление) — изменение существующих записей.
  - **D**elete (Удаление) — удаление записей.
### Остальные термины:
- **JSON**: Это формат данных, используемый для представления структурированных данных, но не является операцией в реляционных базах данных.
- **HTTP**: Это протокол, используемый для передачи данных в интернете, но он сам по себе не является операцией базы данных.
- **RAD (Rapid Application Development)**: Это подход к разработке программного обеспечения, который фокусируется на быстром создании приложений, но также не является операцией базы данных.

##  Какие типы баз данных из перечисленных используются для  работы с соц. сетями и рекомендательными системами (SQL, NoSQL, графовые, документальные)?

Для работы с социальными сетями и рекомендательными системами из перечисленных типов баз данных чаще всего используются:
1. **NoSQL**: Этот тип баз данных хорошо подходит для хранения больших объемов неструктурированных данных и гибкого масштабирования, что важно для социальных сетей и рекомендательных систем.
2. **Графовые базы данных**: Они особенно полезны для социальных сетей, где отношения между пользователями и их взаимодействиями (друзья, подписчики, лайки и комментарии) имеют важное значение. Графовые базы данных позволяют эффективно моделировать и выполнять запросы к сложным сетевым структурам.
3. **Документальные базы данных**: Этот тип базы данных может использоваться для хранения данных в формате JSON или BSON, что удобно для гибкого и быстрого доступа к информации, например, профили пользователей или посты. Документальные базы данных также хорошо справляются с разнообразием данных, что характерно для социальных сетей.


* Хотя SQL-базы данных могут быть использованы для определенных задач в социальных сетях и рекомендательных системах, их жесткая схема и ограничения на масштабируемость делают их менее предпочтительными для динамичных и высоконагруженных приложений, чем NoSQL, графовые и документальные базы данных.


## Выведет ли ошибку следующий запрос: SELECT id FROM ... WHERE id NOT IN (SELECT ...);

Нет, подобное использование "IN" вполне нормально.
## THE END











































