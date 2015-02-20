CREATE TRIGGER `product_trigger` BEFORE INSERT ON `product_details`
 FOR EACH ROW BEGIN
  INSERT INTO user_seq VALUES (NULL);
  SET NEW.product_id = CONCAT('PROD', LPAD(LAST_INSERT_ID(), 3, '0'));
END