CREATE DATABASE chat;

USE chat;

CREATE TABLE rooms (
  id INTEGER NOT NULL AUTO_INCREMENT,
  room_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Messages (
  id INTEGER NOT NULL AUTO_INCREMENT,
  msg_body VARCHAR(140) NOT NULL,
  user_id INTEGER(5) NOT NULL,
  room_id INTEGER(5) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (room_id) REFERENCES rooms (id)
);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE Messages ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE rooms ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE users ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO Messages (id,msg_body,user_id,room_id) VALUES
-- ('','','','');
-- INSERT INTO rooms (id,room_name) VALUES
-- ('','');
-- INSERT INTO users (id,user_name) VALUES
-- ('','');



/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

-- INSERT INTO Messages
-- VALUES(0, 'test test',
-- (SELECT id FROM users WHERE user_name = 'Andy'),
-- (SELECT id FROM rooms WHERE room_name = 'waiting room'));

-- INSERT INTO users
-- VALUES(0, 'Andy');