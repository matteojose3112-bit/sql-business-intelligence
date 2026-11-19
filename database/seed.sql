-- Entirely synthetic sample records for portfolio demonstration.
INSERT INTO customers VALUES
(1,'Avery Morgan','Enterprise','North','2025-01-12'),
(2,'Jordan Lee','Small Business','South','2025-02-03'),
(3,'Taylor Brooks','Consumer','East','2025-02-18'),
(4,'Riley Patel','Enterprise','West','2025-03-04'),
(5,'Casey Rivera','Small Business','North','2025-03-21'),
(6,'Morgan Chen','Consumer','South','2025-04-02'),
(7,'Quinn Davis','Enterprise','East','2025-04-16'),
(8,'Jamie Wilson','Small Business','West','2025-05-08');

INSERT INTO products VALUES
(101,'Analytics Suite','Software',120,240),
(102,'Workflow Pro','Software',75,180),
(103,'Support Package','Services',40,100),
(104,'Data Connector','Integration',55,130),
(105,'Training Workshop','Services',90,160);

INSERT INTO orders VALUES
(1001,1,'2025-01-15','Direct','Completed'),
(1002,2,'2025-01-22','Online','Completed'),
(1003,3,'2025-02-04','Online','Completed'),
(1004,4,'2025-02-17','Partner','Completed'),
(1005,5,'2025-03-05','Direct','Completed'),
(1006,6,'2025-03-18','Online','Returned'),
(1007,7,'2025-04-02','Partner','Completed'),
(1008,8,'2025-04-19','Online','Completed'),
(1009,1,'2025-05-07','Direct','Completed'),
(1010,2,'2025-05-20','Online','Completed'),
(1011,4,'2025-06-03','Partner','Completed'),
(1012,5,'2025-06-22','Direct','Cancelled'),
(1013,3,'2025-07-09','Online','Completed'),
(1014,7,'2025-08-14','Partner','Completed'),
(1015,8,'2025-09-01','Online','Completed'),
(1016,1,'2025-10-11','Direct','Completed'),
(1017,6,'2025-11-03','Online','Completed'),
(1018,4,'2025-12-08','Partner','Completed');

INSERT INTO order_items VALUES
(1,1001,101,2,240,0.05),(2,1001,104,1,130,0),
(3,1002,102,3,180,0.10),(4,1003,103,2,100,0),
(5,1004,101,4,240,0.08),(6,1004,105,1,160,0),
(7,1005,104,2,130,0.05),(8,1006,103,3,100,0),
(9,1007,101,3,240,0.10),(10,1008,102,2,180,0),
(11,1009,105,2,160,0.05),(12,1009,104,2,130,0),
(13,1010,102,1,180,0),(14,1011,101,2,240,0.05),
(15,1012,103,1,100,0),(16,1013,104,3,130,0.10),
(17,1014,105,2,160,0),(18,1015,102,2,180,0.05),
(19,1016,101,1,240,0),(20,1017,103,2,100,0),
(21,1018,104,2,130,0.05),(22,1018,101,1,240,0);
