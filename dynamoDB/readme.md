#### 1. SQL与NoSQL的区别

SQL（结构化查询语言）数据库成为主流的数据存储机制已经存在了80余年。
NoSQL数据库产生于1960年代，但是最近才出现了一些类似于MongoDB、CouchDB、Redis和Apache Cassandra这样的流行选择。

 1. SQL的表 vs NoSQL的文档:SQL表创建的是严格的数据模板，所以你很难犯错。而NoSQL更加灵活，但是能够在任何地方存储数据可能会导致持续的问题。
 2. SQL架构 在一个SQL数据库中，在你确定表和字段类型这些架构之前是无法添加数据的。在NoSQL数据库中，数据可以被非常灵活的添加。并不需要事先进行字段设计和表的设计。
 3. SQL 中心化 vs NoSQL去中心化
 4. SQL关系型的JOIN vs NoSQL ：NoSQL没有相对应的JOIN，这可能对那些熟练使用SQL的人非常不习惯。如果我们使用中心化的NoSQL集合，那我们需要拉取所有的book文档，再获取所有的publisher文档，再手动的通过程序逻辑来把两者联系起来。这也是为什么对NoSQL往往使用去中心化的方式很有必要。
 5. SQL vs NoSQL 数据完整性 这种模式强制了数据库应该遵循的规范。对于开发者或者用户而言，无法在可能引入孤儿数据或非法数据的情况下，对数据条目进行编辑或删除。但是在NoSQL中却没有类似的数据完整性保证。你可以不管其他的文档，只存储你想要存储的内容。理想的情况下，一个数据条目应该成为关于一个事物的唯一信息来源。
 6. SQL vs NoSQL 事务 在SQL数据库中，两条或多条更新语句能够在一个事务（保证成功或失败回滚的机制）中被同时执行。在NoSQL数据库中，对单个文档的修改是原子的。也就是说，如果你在文档中更新三个字段，那么要么三个字段同时更新，要么都不变。但是对于多条文档的更新而言却没有事务。
 7. SQL vs NoSQL CRUD 语法：
     1. SQL是轻量级的解释性语言。语法强大，并且已经成为了国际标准。尽管大多数系统实现语法的时候略有不同。
     NoSQL数据库使用带json参数的类javascript语言一样的查询。基本的操作比较简单，但是对于更复杂的查询来说，嵌套的JSON会非常的繁复。
 8. SQL vs NoSQL 性能表现
     你的项目设计和数据库设计的影响很大。一个被设计的很好的SQL数据库肯定比设计的很差的NoSQL数据库性能好很多，当然反之亦然。
 9. SQL vs NoSQL 扩容
 10.SQL vs NoSQL 总结
     适用于SQL的项目：
         可以被预先确定的逻辑相关的离散数据
         数据完整性是必须的
         需要具有丰富开发者经验和支持的标准技术的项目
      适用于NoSQL的项目:
         非关系型的、模糊的或是不断演进的数据存储需求
         简单、宽松的项目目标，能够快速的开始编程
         速度和可扩展性很有必要
     

     

​                

#### 2. DynamoDB 概念

1. 什么是dynamoDB
   Amazon DynamoDB is a fully managed NoSQL database service that provides fast and predictable performance with seamless scalability. 

2. Table, Item, Attributes
   In DynamoDB, tables, items, and attributes are the core components that you work with. A table is a collection of items, and each item is a collection of attributes. DynamoDB uses primary keys to uniquely identify each item in a table and secondary indexes to provide more querying flexibility. You can use DynamoDB Streams to capture data modification events in DynamoDB tables.
   Tables – Similar to other database systems, DynamoDB stores data in tables. A table is a collection of data. For example, see the example table called People that you could use to store personal contact information about friends, family, or anyone else of interest. You could also have a Cars table to store information about vehicles that people drive.

   **Items** – Each table contains zero or more items. An item is a group of attributes that is uniquely identifiable among all of the other items. In a People table, each item represents a person. For a Cars table, each item represents one vehicle. Items in DynamoDB are similar in many ways to rows, records, or tuples in other database systems. In DynamoDB, there is no limit to the number of items you can store in a table.

   **Attributes** – Each item is composed of one or more attributes. An attribute is a fundamental data element, something that does not need to be broken down any further. For example, an item in a People table contains attributes called PersonID, LastName, FirstName, and so on. For a Department table, an item might have attributes such as DepartmentID, Name, Manager, and so on. Attributes in DynamoDB are similar in many ways to fields or columns in other database systems.

3.  **Primary Key(Hash Key, Range Key)**
   When you create a table, in addition to the table name, you must specify the primary key of the table. The primary key uniquely identifies each item in the table, so that no two items can have the same key.
   Partition key – A simple primary key, composed of one attribute known as the partition key.
   Partition key and sort key – Referred to as a composite primary key, this type of key is composed of two attributes. The first attribute is the partition key, and the second attribute is the sort key.

4. **Index**
   You can create one or more secondary indexes on a table. A secondary index lets you query the data in the table using an alternate key, in addition to queries against the primary key.
   Secondary Indexes
   DynamoDB supports two kinds of indexes:

   Global secondary index – An index with a partition key and sort key that can be different from those on the table.

   Local secondary index – An index that has the same partition key as the table, but a different sort key.

5. **DynamoDB Stream**
   DynamoDB Streams is an optional feature that captures data modification events in DynamoDB tables. The data about these events appear in the stream in near-real time, and in the order that the events occurred.

6. **数据类型**
   Scalar Types – A scalar type can represent exactly one value. The scalar types are number, string, binary, Boolean, and null.
   The scalar types are number, string, binary, Boolean, and null.

   Document Types – A document type can represent a complex structure with nested attributes, such as you would find in a JSON document. The document types are list and map.

   Set Types – A set type can represent multiple scalar values. The set types are string set, number set, and binary set.

7. **数据一致性**

   Eventually Consistent Reads

   When you read data from a DynamoDB table, the response might not reflect the results of a recently completed write operation. The response might include some stale data. If you repeat your read request after a short time, the response should return the latest data.

   Strongly Consistent Reads

   When you request a strongly consistent read, DynamoDB returns a response with the most up-to-date data, reflecting the updates from all prior write operations that were successful. 

8. **读写容量模式**
   Amazon DynamoDB has two read/write capacity modes for processing reads and writes on your tables:

   On-demand

   Provisioned (default, free-tier eligible)

9. **分区与数据分配**

   Amazon DynamoDB stores data in partitions. A partition is an allocation of storage for a table, backed by solid state drives (SSDs) and automatically replicated across multiple Availability Zones within an AWS Region. Partition management is handled entirely by DynamoDB—you never have to manage partitions yourself.
   If your table has a simple primary key (partition key only), DynamoDB stores and retrieves each item based on its partition key value.
   To write an item to the table, DynamoDB uses the value of the partition key as input to an internal hash function. The output value from the hash function determines the partition in which the item will be stored.
   If the table has a composite primary key (partition key and sort key), DynamoDB calculates the hash value of the partition key in the same way as described in Data Distribution: Partition Key. However, it stores all the items with the same partition key value physically close together, ordered by sort key value.

   

   #### Questions

   1. 一下哪种是nosql数据库

      1，2， 3，4

   2. 下面那些场景sql不能发挥作用

      2，3

   3. dynamoD有哪两种主键

      1. **分区键** – 由一个名为 *partition key* 的属性构成的简单主键。
      2. **分区键和排序键** – 称为*复合主键*，此类型的键由两个属性组成。

   4. 主键不支持的数据类型

      4 array

   5. dynamoDB支持哪两种类型的索引，这两种索引的区别是什么？

      - Global secondary index – 一种带有可能与表中不同的分区键和排序键的索引。
      - 本地二级索引 – 分区键与表中的相同但排序键与表中的不同的索引。

   #### DynamoDB事务

   1. TransactWriteItems,TransactGetItems

      `TransactWriteItems` 是一个同步和幂等的写入操作，它将最多 25 个写入操作分组在单个“要么全有要么全无”操作中。这些操作的目标是同一个 AWS 账户和同一个区域内的一个或多个 DynamoDB 表中最多 25 个不同的项目。事务中项目的合计大小不能超过 4 MB。这些操作以原子方式完成，以便所有操作都成功或都失败。

      `TransactGetItems` 是一个同步读取操作，它可将多达 25 个 `Get` 操作分组在一起。这些操作的目标是同一个 AWS 账户和区域内的一个或多个 DynamoDB 表中最多 25 个不同的项目。事务中项目的合计大小不能超过 4 MB。

   2. 隔离级别

      1. *Serializable* isolation ensures that the results of multiple concurrent operations are the same as if no operation begins until the previous one has finished.

         There is serializable isolation between the following types of operation:

         - Between any transactional operation and any standard write operation (`PutItem`, `UpdateItem`, or `DeleteItem`).
         - Between any transactional operation and any standard read operation (`GetItem`).
         - Between a `TransactWriteItems` operation and a `TransactGetItems` operation.

      2. READ-COMMITTED
         Read-committed isolation ensures that read operations always return committed values for an item. Read-committed isolation does not prevent modifications of the item immediately after the read operation.

   3. 冲突级别

      1. A transactional conflict can occur during concurrent item-level requests on an item within a transaction. Transaction conflicts can occur in the following scenarios:

         - A `PutItem`, `UpdateItem`, or `DeleteItem` request for an item conflicts with an ongoing `TransactWriteItems` request that includes the same item.
         - An item within a `TransactWriteItems` request is part of another ongoing `TransactWriteItems` request.
         - An item within a `TransactGetItems` request is part of an ongoing `TransactWriteItems`, `BatchWriteItem`, `PutItem`, `UpdateItem`, or `DeleteItem` request.

         **Note**

         - When a `PutItem`, `UpdateItem`, or `DeleteItem` request is rejected, the request fails with a `TransactionConflictException`.

         - If any item-level request within `TransactWriteItems` or `TransactGetItems` is rejected, the request fails with a `TransactionCanceledException`.

           If you are using the AWS SDK for Java, the exception contains the list of [CancellationReasons](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_CancellationReason.html), ordered according to the list of items in the `TransactItems` request parameter. For other languages, a string representation of the list is included in the exception’s error message.

         - If an ongoing `TransactWriteItems` or `TransactGetItems` operation conflicts with a concurrent `GetItem` request, both operations can succeed.

   4. 容量管理

      There is no additional cost to enable transactions for your DynamoDB tables. You pay only for the reads or writes that are part of your transaction. DynamoDB performs two underlying reads or writes of every item in the transaction: one to prepare the transaction and one to commit the transaction. The two underlying read/write operations are visible in your Amazon CloudWatch metrics.

   #### 备份和还原

   1. 备份表

      您可以为 Amazon DynamoDB 表创建按需备份，或通过时间点恢复来启用连续备份。有关带时间点恢复的连续备份的信息，

      您可以使用 DynamoDB 按需备份功能创建表的完整备份以进行长期保留和存档，从而满足监管合规性需求。您可以通过在 AWS 管理控制台中单击一次，或使用单个 API 调用，随时备份和还原您的表数据。执行备份和还原操作对表性能或可用性没有任何影响。

  