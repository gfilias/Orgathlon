-- User Table
CREATE TABLE User (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(50),
  email VARCHAR(100)
);

-- Athlete Table
CREATE TABLE Athlete (
  athlete_id INT PRIMARY KEY,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Friendlist Table
CREATE TABLE Friendlist (
  friendlist_id INT PRIMARY KEY,
  user_id INT,
  friend_id INT,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (friend_id) REFERENCES User(user_id)
);

-- Admin Table
CREATE TABLE Admin (
  admin_id INT PRIMARY KEY,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Eshop Table
CREATE TABLE Eshop (
  eshop_id INT PRIMARY KEY,
  eshop_name VARCHAR(100)
);

-- Chat Table
CREATE TABLE Chat (
  chat_id INT PRIMARY KEY,
  sender_id INT,
  receiver_id INT,
  message VARCHAR(255),
  timestamp DATETIME,
  FOREIGN KEY (sender_id) REFERENCES User(user_id),
  FOREIGN KEY (receiver_id) REFERENCES User(user_id)
);

-- Reservation Table
CREATE TABLE Reservation (
  reservation_id INT PRIMARY KEY,
  user_id INT,
  facility_id INT,
  reservation_date DATE,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  -- Foreign key reference to the relevant facility table
);

-- Payment Table
CREATE TABLE Payment (
  payment_id INT PRIMARY KEY,
  user_id INT,
  amount DECIMAL(10, 2),
  payment_date DATE,
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Product Table
CREATE TABLE Product (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  price DECIMAL(10, 2),
  description VARCHAR(255),
);

-- Tournament Table
CREATE TABLE Tournament (
  tournament_id INT PRIMARY KEY,
  tournament_name VARCHAR(100),
  tournament_date DATE,
  organizer_id INT,
  FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id)
);