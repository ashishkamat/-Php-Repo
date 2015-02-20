CREATE TRIGGER `user_details_trigger` BEFORE INSERT ON `user_details`
 FOR EACH ROW BEGIN
  INSERT INTO user_details_seq VALUES (NULL);
  SET NEW.user_detail_id = CONCAT('UD', LPAD(LAST_INSERT_ID(), 3, '0'));
END