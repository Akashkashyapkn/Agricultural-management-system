SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Create the blogdata table
CREATE TABLE blogdata (
  blogId INT(10) NOT NULL AUTO_INCREMENT,
  blogUser VARCHAR(256) NOT NULL,
  blogTitle VARCHAR(256) NOT NULL,
  blogContent LONGTEXT NOT NULL,
  blogTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  likes INT(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (blogId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the blogfeedback table
CREATE TABLE blogfeedback (
  blogId INT(10) NOT NULL,
  comment VARCHAR(256) NOT NULL,
  commentUser VARCHAR(256) NOT NULL,
  commentPic VARCHAR(256) NOT NULL DEFAULT 'profile0.png',
  commentTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (blogId) REFERENCES blogdata (blogId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the buyer table
CREATE TABLE buyer (
  bid INT(100) NOT NULL AUTO_INCREMENT,
  bname VARCHAR(100) NOT NULL,
  busername VARCHAR(100) NOT NULL,
  bpassword VARCHAR(100) NOT NULL,
  bhash VARCHAR(100) NOT NULL,
  bemail VARCHAR(100) NOT NULL,
  bmobile VARCHAR(100) NOT NULL,
  baddress TEXT NOT NULL,
  bactive INT(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (bid),
  UNIQUE KEY unique_username (busername)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the farmer table
CREATE TABLE farmer (
  fid INT(255) NOT NULL AUTO_INCREMENT,
  fname VARCHAR(255) NOT NULL,
  fusername VARCHAR(255) NOT NULL,
  fpassword VARCHAR(255) NOT NULL,
  fhash VARCHAR(255) NOT NULL,
  femail VARCHAR(255) NOT NULL,
  fmobile VARCHAR(255) NOT NULL,
  faddress TEXT NOT NULL,
  factive INT(255) NOT NULL DEFAULT '0',
  frating INT(11) NOT NULL DEFAULT '0',
  picExt VARCHAR(255) NOT NULL DEFAULT 'png',
  picStatus INT(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (fid),
  UNIQUE KEY unique_username (fusername)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the fproduct table
CREATE TABLE fproduct (
  fid INT(255) NOT NULL,
  pid INT(255) NOT NULL AUTO_INCREMENT,
  product VARCHAR(255) NOT NULL,
  pcat VARCHAR(255) NOT NULL,
  pinfo VARCHAR(255) NOT NULL,
  price FLOAT NOT NULL,
  pimage VARCHAR(255) NOT NULL DEFAULT 'blank.png',
  picStatus INT(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (pid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the likedata table
CREATE TABLE likedata (
  blogId INT(10) NOT NULL,
  blogUserId INT(10) NOT NULL,
  FOREIGN KEY (blogId) REFERENCES blogdata (blogId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the mycart table
CREATE TABLE mycart (
  bid INT(10) NOT NULL,
  pid INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the product_review table
CREATE TABLE product_review (
  pid INT(10) NOT NULL,
  reviewer_name VARCHAR(255) NOT NULL,
  rating INT(10) NOT NULL,
  comment TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the transactions table
CREATE TABLE transactions (
  id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  bid INT,
  pid INT,
  bname VARCHAR(255),
  city VARCHAR(255),
  mobile VARCHAR(15),
  email VARCHAR(255),
  pincode VARCHAR(10),
  addr TEXT,
  FOREIGN KEY (bid) REFERENCES buyer(bid),
  FOREIGN KEY (pid) REFERENCES fproduct(pid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the buyer_farmer_relation table
CREATE TABLE buyer_farmer_relation (
  buyer_id INT(100) NOT NULL,
  farmer_id INT(255) NOT NULL,
  FOREIGN KEY (buyer_id) REFERENCES buyer(bid),
  FOREIGN KEY (farmer_id) REFERENCES farmer(fid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the members table
CREATE TABLE members (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  member_name VARCHAR(255) NOT NULL,
  member_type ENUM('buyer', 'farmer') NOT NULL,
  UNIQUE KEY unique_member_name (member_name)
);

-- Insert sample data into buyer table
INSERT INTO buyer (bname, busername, bpassword, bhash, bemail, bmobile, baddress, bactive)
VALUES 
('John Doe', 'john_doe', 'password123', 'hashed_password', 'john@example.com', '1234567890', '123 Street, City', 1);

-- Insert sample data into farmer table
INSERT INTO farmer (fname, fusername, fpassword, fhash, femail, fmobile, faddress, factive, frating)
VALUES 
('Farmer Joe', 'farmer_joe', 'farm123', 'hashed_farm', 'joe@example.com', '0987654321', '456 Farm Road, Village', 1, 5);

-- Insert sample data into fproduct table
INSERT INTO fproduct (fid, product, pcat, pinfo, price, pimage, picStatus) 
VALUES 
(1, 'Mango', 'Fruit', '<p>Fresh Mangoes</p>', 500, 'mango.jpg', 1),
(1, 'Rice', 'Grain', '<p>High-quality rice</p>', 800, 'rice.jpg', 1);

-- Verify that fproduct contains valid data
SELECT * FROM fproduct;

-- Insert sample data into transactions table (using valid `bid` and `pid`)
INSERT INTO transactions (bid, pid, bname, city, mobile, email, pincode, addr)
VALUES 
(1, 1, 'John Doe', 'New York', '1234567890', 'john@example.com', '10001', '123 Street, New York');

