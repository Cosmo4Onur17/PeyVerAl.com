CREATE TABLE `Admin` (
  `admin_id` integer PRIMARY KEY,
  `admin_name` varchar(255) NOT NULL,
  `admin_surname` varchar(255) NOT NULL,
  `admin_password_hash` integer NOT NULL,
  `admin_email` varchar(255) UNIQUE NOT NULL,
  `admin_tel_no` varchar(255) UNIQUE,
  `admin_gender` bool NOT NULL,
  `admin_created_at` datetime NOT NULL,
  `admin_updated_at` datetime NOT NULL
);

CREATE TABLE `Member` (
  `member_id` integer PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `password_hash` integer NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `tel_no` varchar(255) UNIQUE,
  `gender` bool NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
);

CREATE TABLE `Artist` (
  `artist_id` integer PRIMARY KEY,
  `artist_name` varchar(255) NOT NULL,
  `artist_surname` varchar(255) NOT NULL,
  `artist_bio` varchar(255),
  `artist_created_at` datetime NOT NULL,
  `artist_updated_at` datetime NOT NULL
);

CREATE TABLE `Artwork` (
  `artwork_id` integer PRIMARY KEY,
  `artwork_title` varchar(255) NOT NULL,
  `artwork_description` varchar(255) NOT NULL,
  `artwork_image_url` varchar(255) NOT NULL,
  `artwork_estimated_price` float,
  `artist_id` integer NOT NULL,
  `artwork_created_at` datetime NOT NULL,
  `artwork_updated_at` datetime NOT NULL
);

CREATE TABLE `Company` (
  `company_id` integer PRIMARY KEY,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) UNIQUE NOT NULL,
  `company_password_hash` integer NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_created_at` datetime NOT NULL,
  `company_updated_at` datetime NOT NULL
);

CREATE TABLE `Auction` (
  `auction_id` integer PRIMARY KEY,
  `auction_title` varchar(255) NOT NULL,
  `auction_description` varchar(255) NOT NULL,
  `auction_start_at` datetime NOT NULL,
  `auction_end_at` datetime NOT NULL,
  `company_id` integer NOT NULL,
  `auction_created_at` datetime NOT NULL,
  `auction_updated_at` datetime NOT NULL
);

CREATE TABLE `Session` (
  `session_id` integer PRIMARY KEY,
  `artwork_id` integer NOT NULL,
  `auction_id` integer NOT NULL,
  `amount` float NOT NULL,
  `commission` float NOT NULL,
  `winner_bid_id` integer,
  `artwork_starting_price` float NOT NULL,
  `artwork_followers_number` integer NOT NULL,
  `transaction_created_at` datetime NOT NULL,
  `transaction_updated_at` datetime NOT NULL
);

CREATE TABLE `Transaction` (
  `transaction_id` integer PRIMARY KEY,
  `member_id` integer,
  `company_id` integer
);

CREATE TABLE `Bid` (
  `bid_id` integer PRIMARY KEY,
  `session_id` integer NOT NULL,
  `member_id` integer NOT NULL,
  `bid_created_at` datetime NOT NULL,
  `bid_price` float NOT NULL
);

CREATE TABLE `Log` (
  `log_id` integer PRIMARY KEY,
  `log_type` varchar(255) NOT NULL,
  `log_message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `member_id` integer,
  `company_id` integer,
  `admin_id` integer
);

CREATE TABLE `Follow` (
  `follow_id` integer PRIMARY KEY,
  `member_id` integer NOT NULL,
  `session_id` integer NOT NULL,
  `follow_created_at` datetime NOT NULL,
  `follow_updated_at` datetime NOT NULL
);

ALTER TABLE `Artwork` ADD FOREIGN KEY (`artist_id`) REFERENCES `Artist` (`artist_id`);

ALTER TABLE `Auction` ADD FOREIGN KEY (`company_id`) REFERENCES `Company` (`company_id`);

ALTER TABLE `Session` ADD FOREIGN KEY (`auction_id`) REFERENCES `Auction` (`auction_id`);

ALTER TABLE `Session` ADD FOREIGN KEY (`artwork_id`) REFERENCES `Artwork` (`artwork_id`);

ALTER TABLE `Log` ADD FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`);

ALTER TABLE `Log` ADD FOREIGN KEY (`company_id`) REFERENCES `Company` (`company_id`);

ALTER TABLE `Log` ADD FOREIGN KEY (`admin_id`) REFERENCES `Admin` (`admin_id`);

ALTER TABLE `Session` ADD FOREIGN KEY (`winner_bid_id`) REFERENCES `Bid` (`bid_id`);

ALTER TABLE `Bid` ADD FOREIGN KEY (`session_id`) REFERENCES `Session` (`session_id`);

ALTER TABLE `Bid` ADD FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`);

ALTER TABLE `Follow` ADD FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`);

ALTER TABLE `Follow` ADD FOREIGN KEY (`session_id`) REFERENCES `Session` (`session_id`);
