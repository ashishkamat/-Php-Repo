CREATE TRIGGER `order_trigger` BEFORE INSERT ON `order_details`
 FOR EACH ROW BEGIN
  INSERT INTO order_seq VALUES (NULL);
  SET NEW.order_id = CONCAT('ORD', LPAD(LAST_INSERT_ID(), 3, '0'));
END