
DROP TABLE IF EXISTS agency;

CREATE TABLE `agency` (
  agency_id VARCHAR(255) PRIMARY KEY,
  agency_name VARCHAR(255),
  agency_url VARCHAR(255),
  agency_timezone VARCHAR(50),
  agency_lang VARCHAR(35),
  agency_phone VARCHAR(50),
  agency_fare_url VARCHAR(255),
  agency_email VARCHAR(255)
);

DROP TABLE IF EXISTS calendar;

CREATE TABLE `calendar` (
  service_id VARCHAR(255),
  monday TINYINT(1),
  tuesday TINYINT(1),
  wednesday TINYINT(1),
  thursday TINYINT(1),
  friday TINYINT(1),
  saturday TINYINT(1),
  sunday TINYINT(1),
  start_date VARCHAR(8),
  end_date VARCHAR(8),
  KEY `service_id` (service_id)
);

DROP TABLE IF EXISTS calendar_dates;

CREATE TABLE `calendar_dates` (
  service_id VARCHAR(255),
  `date` VARCHAR(8),
  exception_type INT(2),
  KEY `service_id` (service_id),
  KEY `exception_type` (exception_type)
);

DROP TABLE IF EXISTS fare_attributes;

CREATE TABLE `fare_attributes` (
  fare_id VARCHAR(255),
  price DECIMAL(9,6),
  currency_type VARCHAR(8),
  payment_method INT(11),
  transfers INT(11),
  agency_id VARCHAR(255),
  transfer_duration INT(11),
  KEY `fare_id` (fare_id)
);

DROP TABLE IF EXISTS fare_rules;

CREATE TABLE `fare_rules` (
  fare_id VARCHAR(255),
  route_id VARCHAR(255),
  origin_id VARCHAR(255),
  destination_id VARCHAR(255),
  contains_id VARCHAR(255),
  KEY `fare_id` (fare_id),
  KEY `route_id` (route_id)
);

DROP TABLE IF EXISTS feed_info;

CREATE TABLE `feed_info` (
  feed_publisher_name VARCHAR(255),
  feed_publisher_url VARCHAR(255),
  feed_lang VARCHAR(35),
  default_lang VARCHAR(35),
  feed_start_date VARCHAR(8),
  feed_end_date VARCHAR(8),
  feed_version VARCHAR(255),
  feed_contact_email VARCHAR(255),
  feed_contact_url VARCHAR(255),
);

DROP TABLE IF EXISTS routes;

CREATE TABLE `routes` (
  route_id VARCHAR(255) PRIMARY KEY,
  agency_id VARCHAR(255),
  route_short_name VARCHAR(50),
  route_long_name VARCHAR(255),
  route_desc VARCHAR(255),
  route_type INT(2),
  route_url VARCHAR(255),
  route_color VARCHAR(6),
  route_text_color VARCHAR(6),
  route_sort_order INT(11),
  continuous_pickup INT(2),
  continuous_drop_off INT(2),
  network_id VARCHAR(255),
  KEY `route_type` (route_type)
);

DROP TABLE IF EXISTS shapes;

CREATE TABLE `shapes` (
  shape_id VARCHAR(255),
  shape_pt_lat DECIMAL(9,6),
  shape_pt_lon DECIMAL(9,6),
  shape_pt_sequence INT(11),
  shape_dist_traveled DECIMAL(9,6),
  KEY `shape_id` (shape_id)
);

DROP TABLE IF EXISTS stop_times;

CREATE TABLE `stop_times` (
  trip_id VARCHAR(255),
  arrival_time VARCHAR(8),
  departure_time VARCHAR(8),
  stop_id VARCHAR(255),
  stop_sequence INT(11),
  stop_headsign VARCHAR(255),
  pickup_type INT(2),
  drop_off_type INT(2),
  continuous_pickup INT(2),
  continuous_drop_off INT(2),
  shape_dist_traveled DECIMAL(9,6),
  timepoint TINYINT(1),

  KEY `trip_id` (trip_id),
  KEY `stop_id` (stop_id),
  KEY `stop_sequence` (stop_sequence)
);

DROP TABLE IF EXISTS stops;

CREATE TABLE `stops` (
  stop_id VARCHAR(255) PRIMARY KEY,
  stop_code VARCHAR(255),
  stop_name VARCHAR(255),
  tts_stop_name VARCHAR(255),
  stop_desc VARCHAR(255),
  stop_lat DECIMAL(9,6),
  stop_lon DECIMAL(9,6),
  zone_id VARCHAR(255),
  stop_url VARCHAR(255),
  location_type INT(2),
  parent_station VARCHAR(255),
  stop_timezone VARCHAR(50),
  wheelchair_boarding INT(2),
  level_id VARCHAR(255),
  platform_code VARCHAR(255),
  KEY `stop_lat` (stop_lat),
  KEY `stop_lon` (stop_lon)
);

DROP TABLE IF EXISTS trips;

CREATE TABLE `trips` (
  route_id VARCHAR(255),
  service_id VARCHAR(255),
  trip_id VARCHAR(255) PRIMARY KEY,
  trip_headsign VARCHAR(255),
  trip_short_name VARCHAR(255),
  direction_id TINYINT(1),
  block_id VARCHAR(255),
  shape_id VARCHAR(255),
  wheelchair_accessible INT(2),
  bikes_allowed INT(2),
  KEY `route_id` (route_id),
  KEY `service_id` (service_id),
  KEY `direction_id` (direction_id),
  KEY `shape_id` (shape_id)
);

LOAD DATA LOCAL INFILE 'agency.txt' INTO TABLE agency FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'calendar.txt' INTO TABLE calendar FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'calendar_dates.txt' INTO TABLE calendar_dates FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'fare_attributes.txt' INTO TABLE fare_attributes FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'fare_rules.txt' INTO TABLE fare_rules FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'routes.txt' INTO TABLE routes FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'shapes.txt' INTO TABLE shapes FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'stop_times.txt' INTO TABLE stop_times FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'stops.txt' INTO TABLE stops FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'trips.txt' INTO TABLE trips FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
